using ProyectoGym.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGym
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClsUsuario.email = txtCorreo.Text;
            ClsUsuario.clave = txtCLave.Text;

            if (ClsUsuario.ValidarLogin(ClsUsuario.email, ClsUsuario.clave) > 0)
            {

                if (ClsUsuario.tipo.Equals("Admin"))
                {

                    Response.Redirect("InicioAdmin.aspx");

                }

                else
                {

                    Response.Redirect("InicioReg.aspx");

                }
            }
            else
            {

                lblMensaje.Text = "¡Usuario o contraseña incorrecto!";

            }

        }
    }
}


