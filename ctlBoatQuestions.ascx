<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBoatQuestions.ascx.cs" Inherits="ctlBoatQuestions" %>

  <style>

   .ar{ float: right;background-color:white; }
.al{ float: left;}
.clear{ clear: both;}


.form1{ background-color:white; padding: 5px; }

.form1 .title{ min-width: 100px; display: inline-block; }


.button{ display: inline-block; background: #000; padding:0px 0px; z-index: 0; color: #fff; background-color:#FF9933;}
.overlay{ z-index:5; background: rgba(0, 0, 0, .50); display: block; position:fixed; width: 100%; height: 100%; }

.popupaskquestion{ padding: 20px 10px 35px; background: white; z-index: 999; display: none; position: fixed; left: 150px; bottom:350px;  margin-bottom:0px; font-size:12px;border: 1px solid #2E2828;}
#footer{ position: fixed; bottom: 0; background: #fff; width: 100%; font-size: 12px; text-align: center; }
#footer div{ padding: 5px; }

.close{ font-weight: bold; color:#337ab7!important; float: right;  background-color:white!important;opacity:1!important }
    </style>




<script>

     

        function showLoginBoxAskQuestion()
        {
          
           

           
            $("body").append(''); $(".popupaskquestion").show();
            $('#ctlBoatQuestions_lblLoginMessage').html("");
            $(".close").click(function (e) {
                $(".popupaskquestion, .overlay").hide();
            });
            
            return false;

        }

        function CloseLoginBox()
        {

            $(".popupaskquestion, .overlay").hide();

            return false;
        }

        function TryLoginAsk()
        {
            var username = document.getElementById('<%= txtLoginName.ClientID%>').value;
            var password = document.getElementById('<%= txtPassword.ClientID%>').value;

            if (password.length == 0)
            {
                $('#ctlBoatQuestions_lblLoginMessage').html("Failed to Login");
                return false;
            }
            LoginAuth.ValidateLogin(username, password, OnSuccessAskQuestion);

            //PageMethods.ValidateLogin(username, password, OnSuccess);
            return false;

        }

    function OnSuccessAskQuestion(result)
        {
           
        

            if (result == "Failed") {
                

                $('#ctlBoatQuestions_lblLoginMessage').html("Failed to Login");
            }
            else {
                $('#ctlBoatQuestions_lblLoginMessage').html("");
                document.forms[0].__EVENTTARGET.value = '<%= btnAskQuestionSignIn.UniqueID%>';
                __doPostBack('<%= btnAskQuestionSignIn.UniqueID%>', 'btnAskQuestionSignIn');
            }
          


        }
    </script>



<style>

    .qsheader
    {
        background-color:gray;
        padding:3px 10px 5px;
        margin-top:20px;
        border: 1px solid #ccc;


    }
</style>

<table style="width:100%;">
    <tr>
        <td>
            
 <%--<table style="width:100%;">
                  <tr>
                      <td>
                       <div class="qsheader">   Questions and Answers about this boat </div>
                      </td>
                      </tr>
     </table>--%>

<asp:GridView ID="gvQuestions"  runat="server" AutoGenerateColumns="false" Width="100%" OnRowDataBound="gvQuestions_RowDataBound" DataKeyNames="Question_id">
    <Columns>
       <asp:TemplateField HeaderText="Questions and Answers about this boat">
           <ItemTemplate>
              <div class="container-fluid">
                  <div class="row">
                      <div class="col-md-9">
                          <asp:Label ID="lblQuestion" runat="server" Text='<%#Bind("Question") %>'></asp:Label>

                      </div>
                      <div class="col-md-2">
                            <asp:Label ID="lblDateCreated" runat="server" Text='<%#Bind("Created_Date") %>'></asp:Label>

                      </div>
                      <div class="col-md-1">
                            <asp:HyperLink ID="lnkAnswer" runat="server" Text='Answer' Target="_blank" CssClass="btn btn-primary"></asp:HyperLink>

                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-12">
                          <br />
<asp:Label ID="Label1" runat="server" Text='<%#Bind("Answer") %>'></asp:Label>

                      </div>
                  </div>
              </div>
               
               
              
              
           </ItemTemplate>

       </asp:TemplateField>
        

    </Columns>
    <EmptyDataTemplate>
        <div>No Questions asked about this boat</div>
    </EmptyDataTemplate>

</asp:GridView>
        </td>
    </tr>
   
    <tr>
        <td>
            <div>
<asp:Button ID="btnAskQuestion" runat="server" CssClass="btn btn-primary" Text="Ask boat owner a question" OnClick="btnAskQuestion_Click"/>
  &nbsp;
            <asp:Button ID="btnBoatOwnerLogin" runat="server" CssClass="btn btn-primary" Text="Boat Owner Log In" OnClientClick="return showLoginBoxAskQuestion();"/>
            
                      <asp:UpdatePanel ID="uplLoginAskQuestion" runat="server">
                                <ContentTemplate>


                               
                    		 <div class="ar login_popup">
                                <div class="col-lg-12 col-sm-12" align="right" style="background-color:#248992!important">
                                    
                                    </div>
                         
                         <div class="popupaskquestion" runat="server" id="loginPopupDiv" >
                            <a href="#" class="close" style="float:right;" onclick="return CloseLoginBox();">[X]</a>
                            <div class="form1">
                                <br />
                                <br />
                                <span style="color:black;">Username:</span><asp:TextBox ID="txtLoginName" runat="server" style="background-color:white!important;color:black!important;width:120px!important"></asp:TextBox><br /><br />
                                <span style="color:black;">Password:</span> <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  style="background-color:white!important;color:black!important;width:120px!important;" CssClass="clspass"></asp:TextBox>
                           <br />
                                <div align="right">
                              
                                    <asp:Button ID="btnAskQuestionSignIn" runat="server"  Text="Sign In"  OnClientClick="return TryLoginAsk();" OnClick="btnSignInAskQuestion_Click" style="margin-top:10px;color:black!important;"/>
                             <br />
                                    <br />
                                <p style="text-align:center;font-size:11px;">
                                    <a href="forgotpassword.aspx" style="color:#248992!important;text-decoration:underline!important">Forgot your password?</a> &nbsp;&nbsp;&nbsp;
                                </p>
                                     
                                <asp:Label ID="lblLoginMessage" runat="server" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                
                                    </div>
                            </div>
                        </div>
                                         
                        
                        </div>

                             </ContentTemplate>

                            </asp:UpdatePanel>
                </div>
        </td>

    </tr>
</table>

 <script type="text/javascript">
            //Bind keypress event to textbox
     $('#ctlBoatQuestions_txtPassword').keypress(function (event) {
        
         var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                   
                    event.stopPropagation();
                
                    TryLoginAsk();

                    


                }
                //Stop the event from propogation to other handlers
                //If this line will be removed, then keypress event handler attached
                //at document level will also be triggered
               // event.stopPropagation();


            });
             


     $('#ctlBoatQuestions_txtLoginName').keypress(function (event) {
         var keycode = (event.keyCode ? event.keyCode : event.which);
         if (keycode == '13') {

             if ($('#ctlBoatQuestions_txtPassword').val().length == 0)
             {
                 $('#ctlBoatQuestions_lblLoginMessage').html("Enter Password.");
                
                 return false;
             }


             event.stopPropagation();

             TryLoginAsk();




         }
         //Stop the event from propogation to other handlers
         //If this line will be removed, then keypress event handler attached
         //at document level will also be triggered
         // event.stopPropagation();


     });


            //Bind keypress event to document
            //$(document).keypress(function(event){
            //    var keycode = (event.keyCode ? event.keyCode : event.which);
            //    if(keycode == '13'){
            //        alert('You pressed a "enter" key in somewhere');   
            //    }
            //});
        </script>