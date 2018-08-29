package sr;

import java.io.RandomAccessFile;

public class MyRec {

    public MyRec() {
    }

    public int writeToFile(RandomAccessFile f, long position) {

        try {
            f.seek(position);

            f.writeUTF(policyCode);
            f.writeUTF(insurerCode);
            f.writeUTF(vehicleCode);
            f.writeUTF(insuranceType);
            f.writeUTF(beginingDate);
            f.writeUTF(endDate);
            f.writeUTF(policySumma);
            f.writeLong(nextpAddr);
            f.writeLong(nextiAddr);
            f.writeLong(nextvAddr);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }

        return 1;
    }

    public int readFromFile(RandomAccessFile f, long position) {

        try {
            f.seek(position);

            policyCode = f.readUTF();
            insurerCode = f.readUTF();
            vehicleCode = f.readUTF();
            insuranceType = f.readUTF();
            beginingDate = f.readUTF();
            endDate = f.readUTF();
            policySumma = f.readUTF();
            nextpAddr = f.readLong();
            nextiAddr = f.readLong();
            nextvAddr = f.readLong();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }

        return 1;
    }

    public String policyCode = "";
    public String insurerCode = "";
    public String vehicleCode = "";
    public String insuranceType = "";
    public String beginingDate = "";
    public String endDate = "";
    public String policySumma = "";

    public long nextpAddr = -1;
    public long nextiAddr = -1;
    public long nextvAddr = -1;
}