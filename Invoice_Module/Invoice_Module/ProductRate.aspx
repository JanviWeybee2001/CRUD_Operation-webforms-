<%@ Page Title="" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="ProductRate.aspx.cs" Inherits="Invoice_Module.ProductRate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Product Rate List
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    
    <asp:GridView CssClass="Table" ID="tblProductRate" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Product_Rate_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="Product_Rate_id" ControlStyle-Width="20%" ItemStyle-CssClass="idFont" >
<ControlStyle Width="20%"></ControlStyle>

<ItemStyle CssClass="idFont"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_id" HeaderStyle-HorizontalAlign="Left" >
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Date_OF_Rate" HeaderText="Date OF Rate" SortExpression="Date_OF_Rate" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="Items" HeaderStyle-Width="40%">
                <ItemTemplate>
                    <asp:ImageButton CssClass="btnEdit" ID="EditBtn" runat="server" ImageUrl="~/Image/edit.png" ToolTip="Edit Party Name" OnClick="EditBtn_Click"/>
                    <asp:ImageButton CssClass="btnDelete" ID="DeleteBtn" runat="server" ImageUrl="~/Image/delete.png" ToolTip="Delete Party Name" OnClientClick="return confirm(&quot;Do you Really want to delete this Rating PRODUCT?&quot;)" OnClick="btnDelete_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
   
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <asp:LinkButton ID="btnAddProductRateItem" runat="server" CssClass="btnADD" PostBackUrl="~/addProductRate.aspx">Add New ProductRate</asp:LinkButton>
</asp:Content>
