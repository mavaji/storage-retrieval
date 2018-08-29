package sr;

import java.io.RandomAccessFile;

public class BTreeNode extends SimpleIndex implements java.io.Serializable {

    public BTreeNode(int maxKeys, int unique) {
        super(maxKeys + 1, unique);
        init();
    }

    public BTreeNode(int maxKeys) {
        super(maxKeys + 1, 1);
        init();
    }

    public int insert(int key, int recAddr) {
        int result;
        result = super.insert(key, recAddr);
        if (result == 0) return 0;
        if (numKeys >= maxKeys) return -1;
        return 1;
    }

    public int remove(int key, int recAddr) {
        int result;
        result = super.remove(key, recAddr);
        if (result == 0) return 0;
        if (numKeys < minKeys) return -1;
        return 1;
    }

    public int remove(int key) {
        return remove(key, -1);
    }

    public void print(RandomAccessFile f) {
        super.print(f);
    }

    public int largestKey() {
        if (numKeys > 0) return keys[numKeys - 1];
        else return keys[0];
    }

    public int split(BTreeNode newNode) {
        if (numKeys < maxKeys) return 0;

        int midpt = (numKeys + 1) / 2;
        int numNewKeys = numKeys - midpt;

        if (numNewKeys > newNode.maxBKeys || numNewKeys < newNode.minKeys) return 0;

        for (int i = midpt; i < numKeys; i++) {
            newNode.keys[i - midpt] = keys[i];
            newNode.recAddrs[i - midpt] = recAddrs[i];
        }

        newNode.numKeys = numNewKeys;
        numKeys = midpt;

        return 1;
    }

    public int merge(BTreeNode fromNode) {
        if (numKeys + fromNode.numKeys > maxKeys - 1) return 0;

        for (int i = 0; i < fromNode.numKeys; i++) {
            keys[numKeys + i] = fromNode.keys[i];
            recAddrs[numKeys + i] = fromNode.recAddrs[i];
        }

        numKeys += fromNode.numKeys;
        nextNode = fromNode.nextNode;

        return 1;
    }

    public int updateKey(int oldKey, int newKey, int recAddr) {
        int recaddr = search(oldKey, recAddr);
        if (recaddr < 0) return 0;
        remove(oldKey, recAddr);
        insert(newKey, recaddr);

        return 1;
    }

    public int updateKey(int oldKey, int newKey) {
        return updateKey(oldKey, newKey, -1);
    }

    public int writeToFile(RandomAccessFile f, long position) {
        try {
            f.seek(position);
            f.writeInt(nextNode);
            f.writeInt(recAddr);
            f.writeInt(minKeys);
            f.writeInt(maxBKeys);
            f.writeInt(maxKeys);
            f.writeInt(numKeys);
            f.writeInt(unique);

            f.writeInt(keys.length);
            for (int i = 0; i < keys.length; i++) f.writeInt(keys[i]);

            f.writeInt(recAddrs.length);
            for (int i = 0; i < recAddrs.length; i++) f.writeInt(recAddrs[i]);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }

    public int readFromFile(RandomAccessFile f, long position) {
        try {
            f.seek(position);
            nextNode = f.readInt();
            recAddr = f.readInt();
            minKeys = f.readInt();
            maxBKeys = f.readInt();
            maxKeys = f.readInt();
            numKeys = f.readInt();
            unique = f.readInt();

            int n = f.readInt();
            keys = new int[n];
            for (int i = 0; i < keys.length; i++) keys[i] = f.readInt();

            n = f.readInt();
            recAddrs = new int[n];
            for (int i = 0; i < recAddrs.length; i++) recAddrs[i] = f.readInt();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }

    protected int init() {
        nextNode = -1;
        recAddr = -1;
        maxBKeys = maxKeys - 1;
        minKeys = maxBKeys / 2;
        return 1;
    }

    protected void clear() {
        numKeys = 0;
        recAddr = -1;
    }

    protected int nextNode;
    protected int recAddr;
    protected int minKeys;
    protected int maxBKeys;
}