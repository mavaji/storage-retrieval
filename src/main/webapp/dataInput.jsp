<html>
<head>
    <title>
        dataInput
    </title>
</head>
<body bgcolor="#6699FF" background="/images/SIGMAWP.JPG">
<p align="center" dir="ltr"><span lang="en-us"><font size="7" color="#FFFFFF">&nbsp;&nbsp;
    <font face="Verdana">Data Input</font></font></span></p>

<p align="left" dir="ltr" style="margin-top: 0; margin-bottom: 0">
    <font face="Verdana" size="1" color="#00FFFF">File
        Type : <%= request.getSession().getAttribute("FileType") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font
        face="Verdana" size="1" color="#00FF00">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
</p>

<p align="left" dir="ltr" style="margin-top: 0; margin-bottom: 0"><font face="Verdana" size="1" color="#00FF00">
    <a href="main.jsp"><font color="#00FF00">go to main Page</font></a></font></p>

<p align="left" dir="ltr" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

<form method="POST" action="/servlet2">
    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">
        <span lang="en-us"><font face="Verdana" color="#FFFFFF">Policy Code</font></span><font face="Arabic Transparent"
                                                                                               color="#FFFFFF">
  <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
  <input type="text" name="PolicyCode1" size="3"></span></font><input type="text" name="PolicyCode2" size="32"></p>

    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">
        <font color="#FFFFFF" face="Verdana"><span lang="en-us">Insurer Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></font><font color="#FFFFFF" face="Arabic Transparent">&nbsp;<span lang="en-us">&nbsp;
  </span>&nbsp;<select size="1" name="InsurerCode1">
        <option>A</option>
        <option>B</option>
        <option>C</option>
        <option>D</option>
        <option>E</option>
        <option>F</option>
        <option>G</option>
        <option>H</option>
        <option>I</option>
        <option>J</option>
        <option>K</option>
        <option>L</option>
        <option>M</option>
        <option>N</option>
        <option>O</option>
        <option>P</option>
        <option>Q</option>
        <option>R</option>
        <option>S</option>
        <option>T</option>
        <option>U</option>
        <option>V</option>
        <option>W</option>
        <option>X</option>
        <option>Y</option>
        <option>Z</option>
    </select></font><input type="text" name="InsurerCode2" size="31"></p>
    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">
        <font color="#FFFFFF" face="Verdana"><span lang="en-us">Vehicle Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></font><font face="Arabic Transparent" color="#FFFFFF">&nbsp;</font><input type="text" name="VehicleCode"
                                                                                    size="39"></p>

    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">
        <font face="Verdana">&nbsp;</font><span lang="en-us"><font face="Verdana" color="#FFFFFF">Insurance
        Type</font></span><font color="#FFFFFF" face="Verdana">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </font><font face="Arabic Transparent" color="#FFFFFF">
        <select size="1" name="InsuranceType">
            <option selected>Robbery Insurance</option>
            <option>Conflagration Insurance</option>
            <option>Shell Insurance</option>
            <option>Third Person Insurance</option>
        </select></font></p>
    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">
        <font color="#FFFFFF" face="Verdana"><span lang="en-us">Begining Date</span></font><font
            face="Arabic Transparent" color="#FFFFFF">
        <span lang="en-us">&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; </span>&nbsp;</font><input type="text" name="BeginingDate"
                                                                                       size="39"></p>

    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">&nbsp;<font color="#FFFFFF" face="Verdana"><span
            lang="en-us">End
  Date</span></font><font face="Arabic Transparent" color="#FFFFFF">
  <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>&nbsp; </font><input type="text" name="EndDate" size="39"></p>

    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">
        <font color="#FFFFFF" face="Verdana"><span lang="en-us">&nbsp;Policy Summa</span></font><font
            face="Arabic Transparent" color="#FFFFFF">
  <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span></font><input type="text" name="PolicySumma" size="39"><font face="Arabic Transparent" color="#FFFFFF"><span
            lang="en-us"> &nbsp;</span></font></p>

    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

    <p align="center" dir="rtl" style="margin-top: 0; margin-bottom: 0">
        <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</span><input type="submit" value="Confirm"
                                                                                           name="Confirm"><span
            lang="en-us">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <input type="hidden" name="PageName" value="dataInput">
</form>
<form method="POST" action="search.jsp">
    <p align="center" dir="ltr" style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
            type="submit" value="    End    " name="End"> &nbsp; </p>
</form>
<p dir="rtl">&nbsp;</p>

</body>
</html>