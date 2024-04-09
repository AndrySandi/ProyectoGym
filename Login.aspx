<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoGym.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Goku's Gym</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

    <style type="text/css">
        .auto-style1 {
            color: #009933;
        }
        .auto-style2 {
            width: 423px;
            height: 394px;
            margin-left: 0px;
        }
        .auto-style3 {
            font-family: Poppins-Bold;
            font-size: 24px;
            color: #333333;
            line-height: 1.2;
            text-align: center;
            width: 99%;
            display: block;
            padding-bottom: 54px;
        }
        .auto-style4 {
            width: 433px;
        }
    </style>

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="auto-style4" data-tilt>
					&nbsp;<img src="Imagenes/LoginGoku.jpg" alt="IMG" aria-checked="undefined" aria-orientation="horizontal" class="auto-style2"></div>
                <form class="login100-form validate-form" runat="server">
					<span class="auto-style3">
						<br />
                    Bienvenidos ㊙</span><div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						
						<asp:TextBox ID="txtCorreo" class="input100" placeholder="Correo" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						
						<asp:TextBox ID="txtCLave" class="input100" placeholder="Contraseña" runat="server"></asp:TextBox>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<asp:Button ID="Button1" class="login100-form-btn" runat="server" Text="Ingresar" OnClick="Button1_Click" BackColor="#339933" />
						
						
					</div>
                    <div class="text-sm-center">
						<br />
						<strong>
						<asp:Label ID="lblMensaje" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                        </strong>
                    </div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Ellos hablan, tú entrena
						</span>
					</div>

					<div class="text-center p-t-136">
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
        
</body>
</html>
