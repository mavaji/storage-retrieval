package sr;

import java.io.RandomAccessFile;

public class SimpleIndex implements java.io.Serializable {

    public SimpleIndex(int maxKeys, int unique) {
        init(maxKeys, unique);
    }

    public SimpleIndex(int maxKeys) {
        init(maxKeys, 1);
    }

    public SimpleIndex() {
        init(100, 1);
    }

    public int insert(int key, int recAddr) {
        int i;
        int index = find(key);
        if (unique == 1 && index >= 0) return 0;
        if (numKeys == maxKeys) return 0;
        for (i = numKeys - 1; i >= 0; i--) {
            if (key > keys[i]) break;
            keys[i + 1] = (keys[i]);
            recAddrs[i + 1] = recAddrs[i];
        }

        keys[i + 1] = (key);
        recAddrs[i + 1] = recAddr;
        numKeys++;

        return 1;
    }

    public int remove(int key, int recAddr) {
        int index = find(key, recAddr);
        if (index < 0) return 0;
        for (int i = index; i < numKeys; i++) {
            keys[i] = (keys[i + 1]);
            recAddrs[i] = recAddrs[i + 1];
        }

        numKeys--;
        return 1;
    }

    public int remove(int key) {
        return remove(key, -1);
    }

    public int search(int key, int recAddr, int exact) {
        int index = find(key, recAddr, exact);
        if (index < 0) return index;
        return recAddrs[index];
    }

    public int search(int key, int recAddr) {
        return search(key, recAddr, 1);
    }

    public int search(int key) {
        return search(key, -1, 1);
    }

    public void print(RandomAccessFile f) {
        try {
            f.write(("Simple Index max keys " + maxKeys + " num keys " + numKeys).getBytes());
            f.write(13);
            f.write(10);

            for (int i = 0; i < numKeys; i++) {
                f.write(("\tKey[" + i + "] " + keys[i] + " RecAddr " + recAddrs[i]).getBytes());
                f.write(13);
                f.write(10);
            }
        } catch (Exception e) {
        }

    }

    public int numKeys() {
        return numKeys;
    }

    protected int find(int key, int recAddr, int exact) {
        for (int i = 0; i < numKeys; i++) {
            if (keys[i] < key) continue;
            if (keys[i] == key) {
                if (recAddr < 0) return i;
                else if (recAddr == recAddrs[i]) return i;
                else return -1;
            }

            if (exact == 0) return i;
            return -1;
        }

        if (exact == 1) return -1;
        else return numKeys - 1;

    }

    protected int find(int key, int recAddr) {
        return find(key, recAddr, 1);
    }

    protected int find(int key) {
        return find(key, -1, 1);
    }

    protected int init(int maxKeys, int unique) {
        this.unique = (unique != 0) ? 1 : 0;
        if (maxKeys <= 0) {
            this.maxKeys = 0;
            return 0;
        }

        this.maxKeys = maxKeys;
        keys = new int[maxKeys];
        recAddrs = new int[maxKeys];

        return 1;
    }

    protected void clear() {
        numKeys = 0;
    }

    protected int maxKeys;
    protected int numKeys = 0;
    protected int[] keys = null;
    protected int[] recAddrs = null;

    protected int unique;
}