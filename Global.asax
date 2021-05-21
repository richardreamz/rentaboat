<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }


    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

        // Handle HTTP errors


        // For other kinds of errors give the user some information
        // but stay on the default page
        //Response.Write("<h2>Global Page Error</h2>\n");
        //Response.Write(
        //    "<p>" + exc.Message + "</p>\n");
        //Response.Write("Return to the <a href='Default.aspx'>" +
        //    "Default Page</a>\n");

        // Log the exception and notify system operators
        // ExceptionUtility.LogException(exc, "DefaultPage");
        //ExceptionUtility.NotifySystemOps(exc);



        // Exception exc = Server.GetLastError();

        // Server.Transfer("index.aspx");
        //// Clear the error from the server
        //Server.ClearError();

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }


</script>
