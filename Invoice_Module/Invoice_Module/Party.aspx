<%@ Page Title="Party_List" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="Party.aspx.cs" Inherits="Invoice_Module.Party" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Party List
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <asp:Label CssClass="exceptionlbl" ID="lblException" runat="server"></asp:Label>
    
    <asp:GridView CssClass="Table" ID="tblParty" runat="server" AutoGenerateColumns="False" DataKeyNames="Party_id" EmptyDataText="There are no data records to display." CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Party_id" HeaderText="#" ReadOnly="True" SortExpression="Party_id" ControlStyle-Width="20%" ItemStyle-CssClass="idFont"/>
            <asp:BoundField DataField="Party_Name" HeaderText="Party Name" SortExpression="Party_Name" ControlStyle-Width="40%" HeaderStyle-HorizontalAlign="Left" />
            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="Items" HeaderStyle-Width="40%">
                <ItemTemplate>
                    <asp:ImageButton CssClass="btnEdit" ID="EditBtn" runat="server" ImageUrl="~/Image/edit.png" ToolTip="Edit Party Name" OnClick="EditBtn_Click" />
                    <asp:ImageButton CssClass="btnDelete" ID="DeleteBtn" runat="server" ImageUrl="~/Image/delete.png" ToolTip="Delete Party Name" OnClientClick="return confirm(&quot;Do you Really want to delete this PARTY?&quot;)" OnClick="btnDelete_Click"/>
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

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <asp:LinkButton ID="btnAddPartyItem" runat="server" CssClass="btnADD" PostBackUrl="~/AddPartyItems.aspx">Add New Party</asp:LinkButton>
</asp:Content>







