﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Menu2.Master" AutoEventWireup="true" CodeBehind="ProductosReg.aspx.cs" Inherits="ProyectoGym.ProductosReg" %>
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
        .auto-style4 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <br />
</p>
<p class="auto-style1">
    &nbsp;</p>
    <p class="auto-style1">
    PRODUCTOS DEL GIMNASIO</p>
    <p class="auto-style1">
        <asp:GridView ID="datagrid1" runat="server" AllowPaging="false" AutoGenerateDeleteButton="false" AutoGenerateEditButton="false" AutoGenerateSelectButton="false" CssClass="auto-style10" HeaderStyle-CssClass="header" PagerStyle-CssClass="pager" RowStyle-CssClass="rows" Height="197px" Width="1064px">
            </asp:GridView>&nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style4">
        &nbsp; CÓDIGO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <asp:TextBox ID="txtCodigoP" runat="server" CssClass="auto-style3"></asp:TextBox>
        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DESCRIPCIÓN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="auto-style3"></asp:TextBox>
        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PRECIO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="auto-style3"></asp:TextBox>
        </strong></p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
         &nbsp;</p>
    <p class="auto-style4">
         <asp:Button ID="btnAgregarP" class="button button3" runat="server" Text="AGREGAR" OnClick="btnAgregarP_Click" />
         &nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="btnBorarP" class="button button3" runat="server" Text="BORARR" OnClick="btnBorarP_Click" /> &nbsp;&nbsp; &nbsp; 
        <asp:Button ID="btnActualizarP" class="button button3" runat="server" Text="ACTUALIZAR" OnClick="btnActualizarP_Click" />
    </p>
    <p class="auto-style4">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
</asp:Content>
