<%@ Page Title="" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="EditParty.aspx.cs" Inherits="Invoice_Module.EditParty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder3">
        Party Edit
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:Label ID="lblPartySts" runat="server" CssClass="lblStatus"></asp:Label>
</asp:Content>

<asp:Content ID="Content8" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div class="addDiv">
        <div class="addtxtDiv">       
            <asp:Label ID="Party" runat="server" Text="Party Name : " CssClass="lblAddtitle"></asp:Label>
            <asp:TextBox ID="txtEditParty" runat="server" CssClass="txtAddfield"></asp:TextBox>      
        </div>
        <div class="addButtonDiv">
            <asp:Button ID="UpdateParty" runat="server" Text="Update" Width="80px" CssClass="btnSave" OnClick="UpdateParty_Click" />
            <asp:LinkButton ID="CancelUPdaate" runat="server" CssClass="btnCancle" PostBackUrl="~/Party.aspx">Cancel</asp:LinkButton>
        </div>
    </div>
</asp:Content>

