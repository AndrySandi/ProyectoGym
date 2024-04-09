using ProyectoGym.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGym
{
    public partial class FacturaciónCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Codigo"), new DataColumn("Nombre"), new DataColumn("cantidad"), new DataColumn("Precio"), new DataColumn("Subtotal") });
                ViewState["Factura"] = dt;
                this.BindGrid();

            }

        }

        protected void BindGrid()
        {
            datagrid1.DataSource = (DataTable)ViewState["Factura"];
            datagrid1.DataBind();
        }

        protected void btnIngresarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable)ViewState["Factura"];
                float sb = (float.Parse(txtCantidad.Text) * float.Parse(txtPrecio.Text));
                ViewState["Subtotal"] = (float.Parse(txtCantidad.Text) * float.Parse(txtPrecio.Text));
                dt.Rows.Add(txtCodigo.Text.Trim(), txtNombre.Text.Trim(), txtCantidad.Text.Trim(), txtPrecio.Text.Trim(), ViewState["Subtotal"]);
                ViewState["Factura"] = dt;
                this.BindGrid();

                ViewState["subtotal"] = (float.Parse(LSB.Text) + sb);
                LSB.Text = (ViewState["subtotal"]).ToString();
                ViewState["IVA"] = (float.Parse(LSB.Text) * 0.13);
                LIVA.Text = (ViewState["IVA"]).ToString();
                ViewState["total"] = (float.Parse(LSB.Text) + float.Parse(LIVA.Text));
                LTOTAL.Text = (ViewState["total"]).ToString();

                txtCodigo.Focus();
                txtCodigo.Text = "";
                txtNombre.Text = "";
                txtCantidad.Text = "";
                txtPrecio.Text = "";

            }
            catch (Exception)
            {


            }


            finally
            {


            }


        }

        protected void btnFacturar_Click(object sender, EventArgs e)
        {
            ClsFacturacion.total = float.Parse(LTOTAL.Text);
            ClsFacturacion.cliente = int.Parse(txtCodigoCliente.Text);

            if (ClsFacturacion.AgregarMaestroFactura() > 0)
            {
                int linea = 0;
                foreach (GridViewRow item in datagrid1.Rows)
                {

                    int codigo = int.Parse(item.Cells[0].Text);
                    int cantidad = int.Parse(item.Cells[2].Text);
                    float precio = float.Parse(item.Cells[3].Text);
                    linea++;
                    if (ClsFacturacion.AgregarDetalleFactura(codigo, cantidad, precio) > 0)
                    {

                    }

                }
                DataTable ds = new DataTable();
                ds = null;
                datagrid1.DataSource = ds;
                datagrid1.DataBind();
            }
        }

        protected void txtCodigo_TextChanged(object sender, EventArgs e)
        {

            if (ClsProducto.BuscarProducto(txtCodigo.Text) > 0)
            {
                txtNombre.Text = ClsProducto.nombre;
                txtPrecio.Text = ClsProducto.precio.ToString();
                txtCantidad.Focus();

            }

        }

    }
}