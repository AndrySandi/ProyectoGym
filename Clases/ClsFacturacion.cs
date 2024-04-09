using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ProyectoGym.Clases
{
    public class ClsFacturacion
    {
        public static int codigoFactura { get; set; }
        public static float total { get; set; }
        public static int cantidad { get; set; }
        public static float precio { get; set; }
        public static int cliente { get; set; }

        public static int AgregarDetalleFactura(int cod, int cant, float precio)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DboConnection.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("DetFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@codigo", cod));
                    cmd.Parameters.Add(new SqlParameter("@cantidad", cant));
                    cmd.Parameters.Add(new SqlParameter("@precio", precio));


                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }

        public static int AgregarMaestroFactura()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DboConnection.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("MaeFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Cliente", cliente));
                    cmd.Parameters.Add(new SqlParameter("@total", total));


                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }


    }
}