﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGym
{
    public partial class ClienteAdmin : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT c.email, c.nombre, c.apellido, c.telefono, d.provincia, d.canton, d.distrito, d.comentarios from Clientes c inner join Direccion d on d.email = c.email "))
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" INSERT INTO clientes(email, nombre, apellido, telefono, edad) VALUES('" + txtCorreo.Text + "', '" + txtNombre.Text + "', '" + txtApellido.Text + "', '" + txtTel.Text + "', '" + txtEdad.Text + "')", conexion);
            SqlCommand comando2 = new SqlCommand(" INSERT INTO Direccion(email, provincia, canton, distrito, comentarios) VALUES('" + txtCorreo.Text + "', '" + DropDownList1.Text + "', '" + DropDownList2.Text + "', '" + DropDownList3.Text + "' , '" + txtComentarios.Text + "')", conexion);
            comando.ExecuteNonQuery();
            comando2.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("DELETE Direccion where email = '" + txtCorreo.Text + "'", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["GimnasioUHConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" UPDATE Clientes SET nombre = '" + txtNombre.Text + "', apellido = '" + txtApellido.Text + "', telefono = '" + txtTel.Text + "', edad = '" + txtEdad.Text + "'  WHERE email = '" + txtCorreo.Text + "'", conexion);
            SqlCommand comando2 = new SqlCommand(" UPDATE Direccion set provincia = '" + DropDownList1.Text + "', canton =  '" + DropDownList2.Text + "', distrito = '" + DropDownList3.Text + "' , comentarios = '" + txtComentarios.Text + "' WHERE email = '" + txtCorreo.Text + "'", conexion);
            comando.ExecuteNonQuery();
            comando2.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }
    }
}