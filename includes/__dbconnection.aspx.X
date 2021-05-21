<%
    //-----Conexion-------'
    Response.Buffer = true;
    con = "Provider=SQLOLEDB;Data Source=192.168.100.23;User Id=usr_boatrenting;Password=passboatrenting;Initial Catalog=BOATRENTING;";
    Response.Expires = 0;
    oConn = new Connection();
    oConn.ConnectionString = con;
    oConn.ConnectionTimeout = 500;
    oConn.Open(null);
%>
