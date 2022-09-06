<%@ Page Title="" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="EditAssignItems.aspx.cs" Inherits="Invoice_Module.EditAssignItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Assign Party Edit
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:Label ID="lblAssignItem" runat="server" CssClass="lblStatus"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div class="addDiv">
        <div class="addtxtDiv">       
            <asp:Label ID="Party" runat="server" Text="Party Name : " CssClass="lblAddtitle"></asp:Label>
            <asp:DropDownList ID="slctParty" runat="server" DataSourceID="selectParty" DataTextField="Party_Name" DataValueField="Party_Name"  CssClass="txtAddfield">
                <asp:ListItem Selected="True">Select Party</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="selectParty" runat="server" ConnectionString="<%$ ConnectionStrings:Party_Product %>" SelectCommand="SELECT [Party_Name] FROM [Party_List]"></asp:SqlDataSource>
            <br />
        </div>
        <div class="addtxtDiv">  
            <asp:Label ID="Product" runat="server" Text="Product Name : " CssClass="lblAddtitle"></asp:Label>
            <asp:DropDownList ID="slctProduct" runat="server" DataSourceID="selectProduct" DataTextField="Product_Name" DataValueField="Product_Name" CssClass="txtAddfield">

            </asp:DropDownList>
            <asp:SqlDataSource ID="selectProduct" runat="server" ConnectionString="<%$ ConnectionStrings:Party_Product %>" SelectCommand="SELECT [Product_Name] FROM [Product_List]"></asp:SqlDataSource>
        </div>
        <div class="addButtonDiv">
            <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="80px" CssClass="btnSave" OnClick="UpdateAssignItems_Click" />
            <asp:LinkButton ID="btnCancle" runat="server" CssClass="btnCancle" PostBackUrl="~/AssignParty.aspx" >Cancel</asp:LinkButton>
        </div>
    </div>
</asp:Content>