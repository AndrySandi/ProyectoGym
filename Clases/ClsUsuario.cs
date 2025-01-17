﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ProyectoGym.Clases
{
    public class ClsUsuario
    {
        public static string email { get; set; }

        public static string clave { get; set; }

        public static string nombre { get; set; }

        public static string tipo { get; set; }


        public static int ValidarLogin(string email, string clave)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DboConnection.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ValidarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@email", email));
                    cmd.Parameters.Add(new SqlParameter("@clave", clave));

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            ClsUsuario.tipo = rdr["tipo"].ToString();
                            retorno = 1;
                        }

                    }

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }
            return retorno;
        }

        
    }
}