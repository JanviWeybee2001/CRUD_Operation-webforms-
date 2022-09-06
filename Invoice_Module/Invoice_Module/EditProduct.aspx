<%@ Page Title="" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Invoice_Module.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Product Edit
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:Label ID="lblProductSts" runat="server" CssClass="lblStatus"></asp:Label>
</asp:Content>

<asp:Content ID="Content8" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div class="addDiv">
        <div class="addtxtDiv">       
            <asp:Label ID="Product" runat="server" Text="Product Name : " CssClass="lblAddtitle"></asp:Label>
            <asp:TextBox ID="txtEditProduct" runat="server" CssClass="txtAddfield"></asp:TextBox>      
        </div>
        <div class="addButtonDiv">
            <asp:Button ID="UpdateProduct" runat="server" Text="Update" Width="80px" CssClass="btnSave" OnClick="UpdateProduct_Click" />
            <asp:LinkButton ID="CancelUPdate" runat="server" CssClass="btnCancle" PostBackUrl="~/Products.aspx">Cancel</asp:LinkButton>
        </div>
    </div>
</asp:Content>