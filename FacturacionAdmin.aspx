<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="FacturacionAdmin.aspx.cs" Inherits="ProyectoGym.FacturacionAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/EstiloGrid.css" rel="stylesheet" />
    <link href="Estilos/EstilosBotones.css" rel="stylesheet" />
    <style type="text/css">


* {
    padding: 0;
    margin: 0;
}

        .auto-style1 {
            text-align: center;
        height: 36px;
    }
        .auto-style5 {
            text-align: center;
            color: #990000;
            width: 153px;
        }
        .auto-style10 {
            border: solid 2px black;
            min-width: 80%;
            margin-right: 71;
        }
        .auto-style11 {
            text-align: center;
            color: #990000;
            width: 419px;
        height: 38px;
    }
        .auto-style12 {
            text-align: center;
            width: 419px;
        height: 36px;
    }
        .auto-style13 {
            background-color: #FFFFCC;
            font-weight: bold;
        }
    .auto-style14 {
        text-align: center;
        color: #990000;
        width: 437px;
        height: 38px;
    }
    .auto-style15 {
        text-align: center;
        width: 437px;
        height: 36px;
    }
    .auto-style16 {
        width: 1162px;
    }
    .auto-style17 {
        text-align: center;
        color: #990000;
        height: 38px;
    }
        .auto-style18 {
            width: 124px;
            text-align: center;
        }
        .auto-style19 {
            width: 333px;
            text-align: center;
        }
        .auto-style20 {
            text-align: left;
            color: #990000;
            width: 333px;
        }
        .auto-style21 {
            text-align: left;
            color: #990000;
        }
        .auto-style22 {
            text-align: left;
            color: #990000;
            width: 124px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
       <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table border="2">
        <tr>
            <td class="auto-style22"><strong>Codigo</strong></td>
            <td class="auto-style21"><strong>Producto</strong></td>
            <td class="auto-style21"><strong>Cantidad</strong></td>
            <td class="auto-style20"><strong>Precio</strong></td>
        </tr>
        <tr>
            <td class="auto-style18">
                <strong>
                <asp:TextBox ID="txtCodigo" runat="server" Width="224px" CssClass="auto-style13" ></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style5">
                <strong>
                <asp:TextBox ID="txtProducto" runat="server" Width="264px" CssClass="auto-style13" ></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style5">
                <strong>
                <asp:TextBox ID="txtCantidad" runat="server" Width="234px" CssClass="auto-style13"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style19">
                <br />
                <br />
                <strong>
                <asp:TextBox ID="txtPrecio" runat="server" CssClass="auto-style13" Width="301px"></asp:TextBox>
                </strong>
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style22"><strong>Codigo cliente</strong></td>
            <td class="auto-style21"><strong>Nombre Cliente</strong></td>
            <td class="auto-style21"><strong>Fecha</strong></td>
            <td class="auto-style20"><strong>Numero factura</strong></td>
        </tr>
        <tr>
            <td class="auto-style18">
                <strong>
                <asp:TextBox ID="txtCodigoCliente" runat="server" Width="224px" CssClass="auto-style13"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style5">
                <strong>
                <asp:TextBox ID="txtNombre" runat="server" Width="264px" CssClass="auto-style13"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style5">
                <em><strong>
                <asp:TextBox ID="txtFecha" runat="server" Width="234px" CssClass="auto-style13"></asp:TextBox>
                </strong></em>
            </td>
            <td class="auto-style19">
                <br />
                <br />
                <strong>
                <asp:TextBox ID="txtNumeroFactura" runat="server" CssClass="auto-style13" Width="301px"></asp:TextBox>
                </strong>
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button runat="server" class="button button2" Text="INGRESAR" ID="btnIngresarProducto" OnClick="btnIngresarProducto_Click"  />
    <br />
    <br />
    <asp:GridView ID="datagrid1" runat="server" AllowPaging="false" AutoGenerateDeleteButton="false" AutoGenerateEditButton="false" AutoGenerateSelectButton="false" CssClass="auto-style10" HeaderStyle-CssClass="header" PagerStyle-CssClass="pager" RowStyle-CssClass="rows" Height="197px" Width="1064px">
            </asp:GridView>
    <br />
    <br />
    <table border="1" class="auto-style16">
        <tr>
            <td class="auto-style14"><strong>SUBTOTAL</strong></td>
            <td class="auto-style17"><strong>IVA</strong></td>
            <td class="auto-style11"><strong>TOTAL</strong></td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:Label ID="LSB" runat="server" Font-Size="Large" Text="0"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="LIVA" runat="server" Font-Size="Large" Text="0"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="LTOTAL" runat="server" Font-Size="Large" Text="0"></asp:Label>
                </td>
        </tr>
    </table>
    <br />
    <asp:Button class="button button2" runat="server" Text="FACTURAR" ID="btnFacturar" OnClick="btnFacturar_Click" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
