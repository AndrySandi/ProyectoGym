﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="ProductosAdmin.aspx.cs" Inherits="ProyectoGym.ProductosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/EstiloGrid.css" rel="stylesheet" />
    <link href="Estilos/EstilosBotones.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style3 {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <p class="auto-style1">
    &nbsp;PRODUCTOS DEL GIMNASIO</p>
    <asp:GridView ID="datagrid1" runat="server" AllowPaging="false" AutoGenerateDeleteButton="false" AutoGenerateEditButton="false" AutoGenerateSelectButton="false" CssClass="auto-style10" HeaderStyle-CssClass="header" PagerStyle-CssClass="pager" RowStyle-CssClass="rows" Height="197px" Width="1064px">
            </asp:GridView>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;CÓDIGO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <asp:TextBox ID="txtCodigoP" runat="server" CssClass="auto-style3"></asp:TextBox>
        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DESCRIPCIÓN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="auto-style3"></asp:TextBox>
        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PRECIO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="auto-style3"></asp:TextBox>
        </strong> </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button runat="server" class="button button3" Text="AGREGAR" OnClick="Unnamed1_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" class="button button3" Text="BORRAR" OnClick="Unnamed2_Click" />
    &nbsp;&nbsp;&nbsp;
   <asp:Button runat="server" class="button button3" Text="ACTUALIZAR" OnClick="Unnamed3_Click" /> </p>
    <p>
    </p>
</asp:Content>
