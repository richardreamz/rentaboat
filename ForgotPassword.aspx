<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/ctlTopMenu.ascx" TagPrefix="uc1" TagName="ctlTopMenu" %>
<%@ Register Src="~/ctlFooter.ascx" TagPrefix="uc1" TagName="ctlFooter" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MEMBER SIGN IN </title>
        
<meta name="viewport" content="width=device-width, initial-scale=1" />
  
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-872206-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-872206-2');
</script>
    
    <style>
        body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-color: #003D78;
}

body {
  font-size: 16px;
}

.small {
  font-size: 12px; /* 75% of the baseline */
}

.large {
  font-size: 20px; /* 125% of the baseline */
}

        .card-container.card {
    width: 350px;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #fff;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    /*-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);*/

    -webkit-box-shadow: -1px 1px 5px 9px rgba(0,0,0,0.75);
 -moz-box-shadow: -1px 1px 5px 9px rgba(0,0,0,0.75);
 box-shadow: -1px 1px 5px 9px rgba(0,0,0,0.75);
}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputEmail,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin .form-control:focus {
    border-color: #0685FF;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px #0066CC;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px #0066CC;
}

.btn-signin {
    /*background-color: #4d90fe; */
    background-color: #0066CC;
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn-signin:hover,
.btn-signin:active,
.btn-signin:focus {
    background-color: #0685FF;
}

.forgot-password {
    color: #0685FF;
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: #004e99;
}


    </style>



</head>
<body>
   	
    <form runat="server" id="frmLogin" defaultbutton="btnLogin">

   
                
<header id="header" >
<!-- TOP LINE -->
					
    <uc1:ctlTopMenu runat="server" ID="ctlTopMenu" />
<!--==============================content=================================-->

      <div class="container" >
      	<div class="row_header2" align="center" >
        	<h1 class="white" >Welcome Aboard!</h1>
              
                         
      </div>         
	</div>

</header>
<!--==============================content=================================-->

    <!--==============================row_1=================================-->
 <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="./img/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <div class="form-signin">
             <span id="reauth-email" class="reauth-email"></span>
                
                <asp:TextBox ID="inputEmail" runat="server" CssClass="form-control" placeholder="Email Address"  required autofocus></asp:TextBox>
              <%--  <input type="email" id="inputEmail" class="form-control" placeholder="User Name" required autofocus>--%>
               
             
              
                <asp:Button ID="btnLogin" runat="server" Text="Let's Go !" style="padding:0px!important;" CssClass="btn btn-lg btn-primary btn-block btn-signin" OnClick="btnLogin_Click" />
            </div><!-- /form -->
            <a class="forgot-password">
                We will send the password to your email address.
            </a>
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
        </div><!-- /card-container -->
    </div><!-- /container -->
   
    </form>
  
    <uc1:ctlFooter runat="server" ID="ctlFooter" />
</body>
</html>