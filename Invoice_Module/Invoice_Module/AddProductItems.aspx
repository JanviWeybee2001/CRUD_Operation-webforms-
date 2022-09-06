<%@ Page Title="" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="AddProductItems.aspx.cs" Inherits="Invoice_Module.AddProductItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Product Add
</asp:Content>

<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <asp:Label ID="lblProductSts" runat="server" CssClass="lblStatus"></asp:Label>
</asp:Content>


<asp:Content ID="Content8" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div class="addDiv">
    <div class="addtxtDiv">      
        <asp:Label ID="Product" runat="server" Text="Product Name : " CssClass="lblAddtitle"></asp:Label>
        <asp:TextBox ID="txtAddProduct" runat="server" CssClass="txtAddfield"></asp:TextBox>      
    </div>
        <div class="addButtonDiv">
            <asp:Button ID="SaveProduct" runat="server" Text="Save" Width="80px" CssClass="btnSave" OnClick="SaveProduct_Click" />
            <asp:LinkButton ID="CancelProduct" runat="server" PostBackUrl="~/Products.aspx" CssClass="btnCancle">Cancel</asp:LinkButton>
        </div>
        </div>
</asp:Content>



