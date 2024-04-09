using ProyectoGym.Clases;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGym
{
    public partial class Usuarios1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT u.Email, u.Clave, U.nombre, U.Tipo FROM Usuarios u"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid1.DataSource = dt;
                            datagrid1.DataBind();

                        }
                    }
                }
            }
        }

        protected void btnIngresarU_Click(object sender, EventArgs e)
        {

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("insert into Usuarios (Email, Clave, Nombre, Tipo) values('" + txtCorreoUsuario.Text + "', '" + txtClaveUsuario.Text + "', '" + txtNombreUsuario.Text + "', '" + txtTipo.Text + "')", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void btnBorrarU_Click(object sender, EventArgs e)
        {

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("DELETE Usuarios where email = '" + txtCorreoUsuario.Text + "'", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" UPDATE Usuarios SET clave = '" + txtClaveUsuario.Text + "', nombre = '" + txtNombreUsuario.Text + "', tipo = '" + txtTipo.Text + "'  WHERE email = '" + txtCorreoUsuario.Text + "'", conexion);
            comando.ExecuteNonQuery();
            LlenarGrid();

        }
    }
}