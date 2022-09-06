<%@ Page Title="Product_List" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Invoice_Module.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    
    <asp:Label CssClass="exceptionlbl" ID="lblException" runat="server"></asp:Label>

    <asp:GridView CssClass="Table" ID="tblProduct" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Product_id" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Product_id" HeaderText="#" ReadOnly="True" SortExpression="Product_id"  ControlStyle-Width="20%" ItemStyle-CssClass="idFont"/>
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_Name"  ControlStyle-Width="40%" HeaderStyle-HorizontalAlign="Left" />
            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="Items" HeaderStyle-Width="40%">
                <ItemTemplate>
                    <asp:ImageButton CssClass="btnEdit" ID="EditBtn" runat="server" ImageUrl="~/Image/edit.png" ToolTip="Edit Party Name"  OnClick="EditBtn_Click" />
                    <asp:ImageButton CssClass="btnDelete" ID="DeleteBtn" runat="server" ImageUrl="~/Image/delete.png" ToolTip="Delete Party Name" OnClientClick="return confirm(&quot;Do you Really want to delete this PRODUCT?&quot;)" OnClick="btnDelete_Click"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
</asp:Content>


<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Product List
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <asp:LinkButton ID="btnAddProductItem" runat="server" CssClass="btnADD" PostBackUrl="~/AddProductItems.aspx">Add New Product</asp:LinkButton>
</asp:Content>

