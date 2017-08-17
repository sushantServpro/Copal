<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MySpacePortal.Pages.Login" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Copal | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link href="../css/style.css" rel="stylesheet" />
</head>
<body>
     <form id="Form1" runat="server">
         <div class="main">
             <div class="container-fluid">
                 <div class="row">
                     <div class="login-box">
                    <div class="login-logo text-center">
                        <a href="#" title="Copal">
                            <img src="../assets/login/logo.png" />

                        </a>
                    </div>
                    <!-- /.login-logo -->
                    <div class="login-box-body">
                        <div class="row login-panel">
                            <div class="col-md-4 col-md-offset-2">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa-2x"></i></span>
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="UserName"></asp:TextBox>
                                    <%--<input type="email" class="form-control" placeholder="Email">--%>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-2x"></i></span>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                                    <%--<input type="password" class="form-control" placeholder="Password">--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                             <!-- /.col -->
                            <div class="col-md-6 col-md-offset-6">
                                <div class="row">
                                    <div class="col-md-4">
                                        <a href="#" title="Forget Password" class="forget_password">Forget Password</a>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnlogin" runat="server" class="btn btn-primary btn-block btn-flat btn-login" Text="Log In" OnClick="btnlogin_Click"  />
                                        <%--<button id="btnlogin" runat="server" type="submit" onclick="" class="btn btn-primary btn-block btn-flat">Sign In</button>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>

    <%--<a href="register.html" class="text-center">Register a new membership</a>--%>

  </div>
  <!-- /.login-box-body -->
</div>
                 </div>
             </div>
         </div>
         </form>
<!-- /.login-box -->

<!-- jQuery 2.2.3 --><%--../../plugins/jQuery/jquery-2.2.3.min.js--%>
<script src=""></script>
<!-- Bootstrap 3.3.6 -->
<script src="../Scripts/bootstrap.min (2).js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>


</body>
</html>

