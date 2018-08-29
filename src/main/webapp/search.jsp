<html>
<head>
    <title>
        search
    </title>
</head>
<body bgcolor="#6699FF" background="/images/SIGMAWP.JPG">

<p align="center"><font face="Verdana" color="#FFFFFF" size="7">&nbsp;&nbsp;&nbsp;
    Search</font></p>

<p align="left" dir="ltr" style="margin-top: 0; margin-bottom: 0">
    <font face="Verdana" size="1" color="#00FFFF">File
        Type :</font><font face="Verdana" size="1" color="#00FF00"><%= request.getSession().getAttribute("FileType") %>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
</p>

<p align="left" dir="ltr" style="margin-top: 0; margin-bottom: 0"><font face="Verdana" size="1" color="#00FF00">
    <a href="dataInput.jsp"><font color="#00FF00">go to dataInput Page</font></a></font></p>

<p align="left" dir="ltr" style="margin-top: 0; margin-bottom: 0">
    <font color="#00FF00" size="1" face="Verdana">
        <a href="main.jsp"><font color="#00FF00">go to main Page</font></a></font></p>

<p align="left" style="margin-top: 0; margin-bottom: 0"><font color="#00FF00">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</font>
    <font color="#00FF00" size="1" face="Verdana">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
</p>

<p align="left" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>

<form method="POST" action="/servlet2">
    <p align="center">
        <font color="#FFFFFF"><font face="Verdana">
            <input type="radio" value="pCode" checked name="Select">Policy Code </font>&nbsp;&nbsp;<input type="text"
                                                                                                          name="PolicyCode1"
                                                                                                          size="3"></font><input
            type="text" name="PolicyCode2" size="33"><font color="#FFFFFF">
    </font></p>

    <p align="center"><font face="Verdana" color="#FFFFFF">
        <input type="radio" name="Select" value="iCode">Insurer Code&nbsp;
        <select size="1" name="InsurerCode1">
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
        </select></font><input type="text" name="InsurerCode2" size="33"><font face="Verdana" color="#FFFFFF">&nbsp;
    </font></p>
    <p align="center"><font face="Verdana" color="#FFFFFF">
        <input type="radio" name="Select" value="vCode">Vehicle Code
    </font><input type="text" name="VehicleCode" size="40"></p>

    <p align="center">&nbsp;</p>

    <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="Search" name="Search"></p>
    <input type="hidden" name="PageName" value="search">
</form>

</body>
</html>