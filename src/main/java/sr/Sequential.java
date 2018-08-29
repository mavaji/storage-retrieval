package sr;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Vector;

public class Sequential {

    public Sequential() {
    }

    public int create(String name) {
        try {
            f = new File(name);
            f.createNewFile();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }

    public int insert(MyRec rec) {

        MyRec tempRec;
        boolean flag = false;
        try {
            in = new FileInputStream(f);

            while (true) {
                tempRec = readFromFile();
                if (tempRec == null) break;
                if (tempRec.policyCode.equals(rec.policyCode)) {
                    in.close();
                    in = new FileInputStream(f);

                    File tempfile = new File(f.getParent(), f.getName() + "1");
                    tempfile.createNewFile();

                    out = new FileOutputStream(tempfile);

                    while (true) {
                        tempRec = readFromFile();
                        if (tempRec == null) break;
                        if (tempRec.policyCode.equals(rec.policyCode))
                            writeToFile(rec);
                        else
                            writeToFile(tempRec);
                    }
                    String s = f.getAbsolutePath();
                    in.close();
                    out.close();

                    System.out.println(f.delete());

                    tempfile.renameTo(new File(s));

                    flag = true;
                    break;
                }

            }

            if (flag == false) {
                out = new FileOutputStream(f.getAbsolutePath(), true);
                writeToFile(rec);
                out.close();
                in.close();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage() + "*insert***");
            return 0;
        }
        return 1;
    }

    public Vector search(String key, int keyType) {
        MyRec tempRec;
        Vector v = new Vector();
        try {

            in = new FileInputStream(f);

            while (true) {
                tempRec = readFromFile();
                if (tempRec == null) break;
                switch (keyType) {
                    case 0:
                        if (tempRec.policyCode.equals(key))
                            v.addElement(tempRec);
                        break;
                    case 1:
                        if (tempRec.insurerCode.equals(key))
                            v.addElement(tempRec);
                        break;
                    case 2:
                        if (tempRec.vehicleCode.equals(key))
                            v.addElement(tempRec);
                        break;
                }
            }
            in.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

        return v;
    }

    public int writeToFile(MyRec rec) {

        try {

            out.write(rec.policyCode.length());
            out.write(rec.policyCode.getBytes());

            out.write(rec.insurerCode.length());
            out.write(rec.insurerCode.getBytes());

            out.write(rec.vehicleCode.length());
            out.write(rec.vehicleCode.getBytes());

            out.write(rec.insuranceType.length());
            out.write(rec.insuranceType.getBytes());

            out.write(rec.beginingDate.length());
            out.write(rec.beginingDate.getBytes());

            out.write(rec.endDate.length());
            out.write(rec.endDate.getBytes());

            out.write(rec.policySumma.length());
            out.write(rec.policySumma.getBytes());

        } catch (IOException e) {
            System.out.println(e.getMessage() + "*writeToFile***");
            return 0;
        }
        return 1;
    }

    public MyRec readFromFile() {
        MyRec rec = new MyRec();
        int n;
        byte[] b;
        try {
            n = in.read();
            if (n == -1) return null;
            b = new byte[n];
            in.read(b);
            rec.policyCode = new String(b);

            n = in.read();
            b = new byte[n];
            in.read(b);
            rec.insurerCode = new String(b);

            n = in.read();
            b = new byte[n];
            in.read(b);
            rec.vehicleCode = new String(b);

            n = in.read();
            b = new byte[n];
            in.read(b);
            rec.insuranceType = new String(b);

            n = in.read();
            b = new byte[n];
            in.read(b);
            rec.beginingDate = new String(b);

            n = in.read();
            b = new byte[n];
            in.read(b);
            rec.endDate = new String(b);

            n = in.read();
            b = new byte[n];
            in.read(b);
            rec.policySumma = new String(b);

        } catch (IOException e) {
            System.out.println(e.getMessage() + "*readFromFile***");
            return null;
        }
        return rec;
    }

    File f;
    FileInputStream in;
    FileOutputStream out;

}