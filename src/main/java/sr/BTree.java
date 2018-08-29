package sr;

import java.io.File;
import java.io.RandomAccessFile;

public class BTree {

    public BTree(int order, int keySize, int unique) {

        root = new BTreeNode(order);

        height = 1;
        this.order = order;
        poolsize = maxHeight * 2;
        nodes = new BTreeNode[poolsize];
        nodes[0] = root;
    }

    public int open(String name, String mode) {

        try {
            File f = new File(name);
            BTreeFile = new RandomAccessFile(f, mode);
            if (BTreeFile == null) return 0;
            height = BTreeFile.readInt();
            root.readFromFile(BTreeFile, 4);

        } catch (Exception e) {
        }

        return 1;
    }

    public int create(String name, String mode) {
        try {
            File f = new File(name);
            if (f.exists()) {
                f.delete();
                f = new File(name);
            }

            BTreeFile = new RandomAccessFile(f, mode);
            if (BTreeFile == null) return 0;
            BTreeFile.writeInt(height);
            root.writeToFile(BTreeFile, 4);
            root.recAddr = 4;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }

        return 1;
    }

    public int close() {
        try {
            BTreeFile.seek(4);
            root.writeToFile(BTreeFile, 4);

            BTreeFile.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }

    public int createMainFile(String name) {
        try {
            File f = new File(name);
            if (f.exists()) {
                f.delete();
                f = new File(name);
            }
            mainFile = new RandomAccessFile(f, "rw");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }

    public int openMainFile(String name) {
        try {
            mainFile = new RandomAccessFile(name, "rw");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }

    public RandomAccessFile getMainFile() {
        return mainFile;
    }

    public int insert(int key, int recAddr, int bType) {
        int result;
        int level = height - 1;
        int newLargest = 0, prevKey = 0;
        BTreeNode thisNode;
        BTreeNode newNode = new BTreeNode(order);
        BTreeNode parentNode = new BTreeNode(order);

        thisNode = findLeaf(key);
        int addr = thisNode.search(key);
        if (addr != -1) {
            MyRec rec = new MyRec();
            rec.readFromFile(mainFile, addr);
            long n = addr;
            if (bType == 0)//**** for repeated Key Occurence  *****
            {
                while (rec.nextpAddr != -1) {
                    n = rec.nextpAddr;
                    rec.readFromFile(mainFile, n);
                }
                rec.nextpAddr = recAddr;
                rec.writeToFile(mainFile, n);
            }
            else if (bType == 1) {
                while (rec.nextiAddr != -1) {
                    n = rec.nextiAddr;
                    rec.readFromFile(mainFile, n);
                }
                rec.nextiAddr = recAddr;
                rec.writeToFile(mainFile, n);
            }
            else if (bType == 2) {
                while (rec.nextvAddr != -1) {
                    n = rec.nextvAddr;
                    rec.readFromFile(mainFile, n);
                }
                rec.nextvAddr = recAddr;
                rec.writeToFile(mainFile, n);
            }

            return 2;
        }
        if (key > thisNode.largestKey()) {
            newLargest = 1;
            prevKey = thisNode.largestKey();
        }


        result = thisNode.insert(key, recAddr);
        if (newLargest != 0)
            for (int i = 0; i < height - 1; i++) {
                nodes[i].updateKey(prevKey, key);
                if (i > 0) store(nodes[i]);
            }

        while (result == -1) {
            newNode = newNode();
            thisNode.split(newNode);
            store(thisNode);
            store(newNode);
            level--;
            if (level < 0) break;
            parentNode = nodes[level];

            result = parentNode.insert(newNode.largestKey(), newNode.recAddr);
            thisNode = parentNode;
        }

        store(thisNode);
        if (level >= 0) return 1;

        int newAddr = 0;
        try {
            newAddr = (int) BTreeFile.length();
            root.writeToFile(BTreeFile, BTreeFile.length());

            root.keys[0] = thisNode.largestKey();
            root.recAddrs[0] = newAddr;
            root.keys[1] = newNode.largestKey();
            root.recAddrs[1] = newNode.recAddr;
            root.numKeys = 2;
            height++;

            BTreeFile.seek(0);
            BTreeFile.writeInt(height);

            root.writeToFile(BTreeFile, 4);
        } catch (Exception e) {
        }

        return 1;
    }

    public int search(int key, int recAddr) {
        BTreeNode leafNode;
        leafNode = findLeaf(key);
        return leafNode.search(key, recAddr);
    }

    public int search(int key) {
        return search(key, -1);
    }

    public void print(RandomAccessFile f) {
        try {
            f.write(("BTree of Height " + height + " is ").getBytes());
            f.write(13);
            f.write(10);

            root.print(f);
            if (height > 1)
                for (int i = 0; i < root.numKeys(); i++)
                    print(f, root.recAddrs[i], 2);

            f.write(("End of BTree!").getBytes());
            f.write(13);
            f.write(10);
        } catch (Exception e) {
        }
    }

    public void print(RandomAccessFile f, int nodeAddr, int level) {
        try {
            BTreeNode thisNode;
            thisNode = fetch(nodeAddr);
            f.write(("Node at level " + level + " address " + nodeAddr).getBytes());
            f.write(13);
            f.write(10);

            thisNode.print(f);
            if (height > level) {
                level++;
                for (int i = 0; i < thisNode.numKeys(); i++)
                    print(f, thisNode.recAddrs[i], level);

                f.write(("End of level " + level + "\n").getBytes());
                f.write(13);
                f.write(10);
            }
        } catch (Exception e) {
        }
    }

    protected BTreeNode findLeaf(int key) {
        int recAddr, level;
        for (level = 1; level < height; level++) {
            recAddr = nodes[level - 1].search(key, -1, 0);
            nodes[level] = fetch(recAddr);
        }
        return nodes[level - 1];
    }

    protected BTreeNode newNode() {
        BTreeNode newNode = new BTreeNode(order);
        try {
            newNode.recAddr = (int) BTreeFile.length();
            newNode.writeToFile(BTreeFile, BTreeFile.length());
        } catch (Exception e) {
        }
        return newNode;
    }

    protected BTreeNode fetch(int recAddr) {
        BTreeNode newNode = new BTreeNode(order);
        newNode.readFromFile(BTreeFile, recAddr);
        newNode.recAddr = recAddr;

        return newNode;
    }

    protected int store(BTreeNode thisNode) {
        return thisNode.writeToFile(BTreeFile, thisNode.recAddr);
    }

    protected BTreeNode root;
    protected int height;
    protected int order;
    protected int poolsize;

    protected BTreeNode[] nodes;
    protected RandomAccessFile BTreeFile;
    protected RandomAccessFile mainFile;

    protected final int maxHeight = 10;

}