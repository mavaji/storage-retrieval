<html>
<head>
    <title>
        result
    </title>
</head>
<%@ page import="sr.* , java.util.Vector" %>
<%! Vector v = new Vector();
    MyRec rec = new MyRec(); %>
<% v = (Vector) session.getAttribute("results"); %>
<body bgcolor="#6699FF" background="/images/SIGMAWP.JPG">
<p align="center"><font face="Verdana" color="#FFFFFF" size="7">Results</font></p>

<p align="left" style="margin-top: 0; margin-bottom: 0">
    <font face="Verdana" size="1" color="#00FFFF">
        File Type : <%= request.getSession().getAttribute("FileType") %>
    </font><font face="Verdana" size="1" color="#00FF00">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
</p>

<p align="left" style="margin-top: 0; margin-bottom: 0"><font face="Verdana" size="1" color="#00FF00">
    <a href="search.jsp"><font color="#00FF00">go to search Page</font></a></font></p>

<p align="left" style="margin-top: 0; margin-bottom: 0"><font face="Verdana" size="1" color="#FFFFFF">
    <a href="dataInput.jsp"><font color="#00FF00">go to dataInput Page </font>
    </a></font></p>

<p align="left" style="margin-top: 0; margin-bottom: 0">
    <font face="Verdana" size="1" color="#00FF00">
        <a href="main.jsp"><font color="#00FF00">go to main Page</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </font></p>

<p align="left" style="margin-top: 0; margin-bottom: 0">
    <font color="#00FF00" face="Verdana" size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </font></p>

<p align="left" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="1" cellpadding="0" cellspacing="0"
       style="border-collapse: collapse; border-style: solid; border-width: 2" bordercolor="#FFFF00" width="100%">
    <tr>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF">Policy Code</font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF">Insurer Code</font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF">Vehicle Code</font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF">Insur - Type</font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF">Begining Date</font></td>
        <td width="15%">
            <p align="center"><font face="Verdana" color="#FFFFFF">End Date</font></td>
        <td width="15%">
            <p align="center"><font face="Verdana" color="#FFFFFF">Insur - Summa</font></td>
    </tr>

    <% for (int i = 0; i < v.size(); i++) {
        rec = (MyRec) v.elementAt(i);%>
    <tr>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.policyCode %>
            </font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.insurerCode %>
            </font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.vehicleCode %>
            </font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.insuranceType %>
            </font></td>
        <td width="14%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.beginingDate %>
            </font></td>
        <td width="15%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.endDate %>
            </font></td>
        <td width="15%">
            <p align="center"><font face="Verdana" color="#FFFFFF"><%= rec.policySumma %>
            </font></td>
    </tr>
    <% } %>
</table>
</body>
</html>