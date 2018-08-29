package sr;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Vector;

public class Servlet2 extends HttpServlet {
    static final private String CONTENT_TYPE = "text/html";

    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    public void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("PageName").equals("main")) {
            doMain(request, response);
        } else if (request.getParameter("PageName").equals("dataInput")) {
            doDataInput(request, response);
        } else if (request.getParameter("PageName").equals("search")) {
            doSearch(request, response);
        }
    }

    public void doMain(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileType;
        String mainPath;
        String BTreePath, BTreePath1, BTreePath2;
        Integer BTreeOrder;

        fileType = request.getParameter("FileType");
        request.getSession().setAttribute("FileType", fileType);

        mainPath = request.getParameter("MainPath");
        request.getSession().setAttribute("MainPath", mainPath);

        if (fileType.equals("BTree")) {
            File f;

            BTreePath = request.getParameter("BTreePath");
            request.getSession().setAttribute("BTreePath", BTreePath);

            BTreePath1 = request.getParameter("BTreePath1");
            request.getSession().setAttribute("BTreePath1", BTreePath1);

            BTreePath2 = request.getParameter("BTreePath2");
            request.getSession().setAttribute("BTreePath2", BTreePath2);

            BTreeOrder = new Integer(request.getParameter("BTreeOrder"));
            request.getSession().setAttribute("BTreeOrder", BTreeOrder);


            int order = BTreeOrder.intValue();

            BTree bt = new BTree(order, 4, 1);
            f = new File(BTreePath);
            if (f.exists()) bt.open(BTreePath, "rw");
            else bt.create(BTreePath, "rw");
            f = new File(mainPath);
            if (f.exists()) bt.openMainFile(mainPath);
            else bt.createMainFile(mainPath);

            BTree bt1 = new BTree(order, 4, 1);
            f = new File(BTreePath1);
            if (f.exists()) bt1.open(BTreePath1, "rw");
            else bt1.create(BTreePath1, "rw");
            f = new File(mainPath);
            if (f.exists()) bt1.openMainFile(mainPath);
            else bt1.createMainFile(mainPath);

            BTree bt2 = new BTree(order, 4, 1);
            f = new File(BTreePath2);
            if (f.exists()) bt2.open(BTreePath2, "rw");
            else bt2.create(BTreePath2, "rw");
            f = new File(mainPath);
            if (f.exists()) bt2.openMainFile(mainPath);
            else bt2.createMainFile(mainPath);

            request.getSession().setAttribute("bt", bt);
            request.getSession().setAttribute("bt1", bt1);
            request.getSession().setAttribute("bt2", bt2);

            f = new File("../reports/report.txt");
            if (f.exists()) {
                f.delete();
                f = new File("../reports/report.txt");
            }
            RandomAccessFile r = new RandomAccessFile(f, "rw");
            bt.print(r);

            f = new File("../reports/report1.txt");
            if (f.exists()) {
                f.delete();
                f = new File("../reports/report1.txt");
            }
            r = new RandomAccessFile(f, "rw");
            bt1.print(r);

            f = new File("../reports/report2.txt");
            if (f.exists()) {
                f.delete();
                f = new File("../reports/report2.txt");
            }
            r = new RandomAccessFile(f, "rw");
            bt2.print(r);

        } else if (fileType.equals("Sequential")) {
            Sequential seq = new Sequential();
            seq.create(mainPath);
            request.getSession().setAttribute("seq", seq);
        }

        RequestDispatcher rd =
                getServletContext().getRequestDispatcher("/dataInput.jsp");
        rd.forward(request, response);

    }

    public void doDataInput(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MyRec rec = new MyRec();
        rec.policyCode = request.getParameter("PolicyCode1")
                + "-" + request.getParameter("PolicyCode2");

        rec.insurerCode = request.getParameter("InsurerCode1")
                + "-" + request.getParameter("InsurerCode2");
        rec.vehicleCode = request.getParameter("vehicleCode");
        rec.insuranceType = request.getParameter("insuranceType");
        rec.beginingDate = request.getParameter("beginingDate");
        rec.endDate = request.getParameter("endDate");
        rec.policySumma = request.getParameter("policySumma");

        if (request.getSession().getAttribute("FileType").equals("BTree")) {
            int x1 = new Integer(request.getParameter("PolicyCode1")).intValue();
            int x2 = new Integer(request.getParameter("PolicyCode2")).intValue();
            int pCode = x2 * 100 + x1;

            BTree b = (BTree) request.getSession().getAttribute("bt");
            b.insert(pCode, (int) b.getMainFile().length(), 0);


            x1 = (int) (request.getParameter("InsurerCode1").toCharArray()[0]);
            x2 = new Integer(request.getParameter("InsurerCode2")).intValue();
            int iCode = x2 * 100 + x1;

            BTree b1 = (BTree) request.getSession().getAttribute("bt1");

            int vCode = new Integer(request.getParameter("vehicleCode")).intValue();

            BTree b2 = (BTree) request.getSession().getAttribute("bt2");
            b2.insert(vCode, (int) b.getMainFile().length(), 2);

            rec.writeToFile(b.getMainFile(), b.getMainFile().length());


            File f = new File("../reports/report.txt");
            RandomAccessFile r = new RandomAccessFile(f, "rw");
            b.print(r);

            f = new File("../reports/report1.txt");
            r = new RandomAccessFile(f, "rw");
            b1.print(r);

            f = new File("../reports/report2.txt");
            r = new RandomAccessFile(f, "rw");
            b2.print(r);
        } else if (request.getSession().getAttribute("FileType").equals("Sequential")) {
            Sequential seq;
            seq = (Sequential) request.getSession().getAttribute("seq");

            seq.insert(rec);
        }

        RequestDispatcher rd =
                getServletContext().getRequestDispatcher("/dataInput.jsp");
        rd.forward(request, response);
    }

    public void doSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String select = request.getParameter("Select");
        Vector v = new Vector();

        if (request.getSession().getAttribute("FileType").equals("BTree")) {
            int code = 0;
            int bType = 0;
            int order = ((Integer) request.getSession().getAttribute("BTreeOrder")).intValue();
            BTree b = new BTree(order, 4, 1);
            if (select.equals("pCode")) {
                int x1 = new Integer(request.getParameter("PolicyCode1")).intValue();
                int x2 = new Integer(request.getParameter("PolicyCode2")).intValue();
                int n = x2 * 100 + x1;
                code = n;
                bType = 0;
                b = (BTree) request.getSession().getAttribute("bt");
            } else if (select.equals("iCode")) {
                int x1 = (int) (request.getParameter("InsurerCode1").toCharArray()[0]);
                int x2 = new Integer(request.getParameter("InsurerCode2")).intValue();
                int n = x2 * 100 + x1;
                code = n;
                bType = 1;
                b = (BTree) request.getSession().getAttribute("bt1");
            } else if (select.equals("vCode")) {
                code = new Integer(request.getParameter("vehicleCode")).intValue();
                bType = 2;
                b = (BTree) request.getSession().getAttribute("bt2");
            }


            MyRec rec = new MyRec();


            long addr = b.search(code);
            rec.readFromFile(b.getMainFile(), addr);
            v.addElement(rec);
            if (bType == 0)//****** for repeated Key Occurence ******
            {
                while (rec.nextpAddr != -1) {
                    addr = rec.nextpAddr;
                    rec = new MyRec();
                    rec.readFromFile(b.getMainFile(), addr);
                    v.addElement(rec);
                }
            } else if (bType == 1) {
                while (rec.nextiAddr != -1) {
                    addr = rec.nextiAddr;
                    rec = new MyRec();
                    rec.readFromFile(b.getMainFile(), addr);
                    v.addElement(rec);
                }
            } else if (bType == 2) {
                while (rec.nextvAddr != -1) {
                    addr = rec.nextvAddr;
                    rec = new MyRec();
                    rec.readFromFile(b.getMainFile(), addr);
                    v.addElement(rec);
                }
            }

        } else if (request.getSession().getAttribute("FileType").equals("Sequential")) {
            Sequential seq = new Sequential();
            seq = (Sequential) request.getSession().getAttribute("seq");
            String s = new String();
            if (select.equals("pCode")) {
                s = request.getParameter("PolicyCode1")
                        + "-"
                        + request.getParameter("PolicyCode2");
                v = seq.search(s, 0);
            } else if (select.equals("iCode")) {
                s = request.getParameter("InsurerCode1")
                        + "-"
                        + request.getParameter("InsurerCode2");
                v = seq.search(s, 1);
            } else if (select.equals("vCode")) {
                s = request.getParameter("vehicleCode");
                v = seq.search(s, 2);
            }
        }

        request.getSession().setAttribute("results", v);

        RequestDispatcher rd =
                getServletContext().getRequestDispatcher("/result.jsp");
        rd.forward(request, response);
    }

    public void destroy() {

    }
}