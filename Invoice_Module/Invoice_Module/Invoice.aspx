<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Invoice_Module.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
            width: 853px;
        }
        .auto-style6 {
            width: 853px;
        }
        .auto-style7 {
            line-height: 40px;
            font-size: 15px;
            margin-left: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Invoice Add
</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <asp:Label ID="lblInvoiceStatus" runat="server" CssClass="lblStatus"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    
    <table class="auto-style3" style="margin-top: 25px; width:100%">
        <colgroup>
            <col style="width:50%" />
            <col style="width:50%" />
        </colgroup>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Party" runat="server" Text="Party Name : " CssClass="lblAddtitle"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:DropDownList ID="slctParty" runat="server" DataTextField="Party_Name" DataValueField="Party_Name" CssClass="auto-style7" Height="32px" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="slctParty_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" >
                <asp:Label ID="Product" runat="server" Text="Product Name : " CssClass="lblAddtitle"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:DropDownList ID="slctProduct" runat="server" CssClass="auto-style7" Height="32px" Width="180px" DataTextField="Product_Name" DataValueField="Product_Name" AutoPostBack="True" OnSelectedIndexChanged="slctProduct_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="lblRate" runat="server" Text="Current Rate : " CssClass="lblAddtitle"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtRate" runat="server" CssClass="auto-style7" Height="21px" Width="177px"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Quantity" runat="server" Text="Quantity : " CssClass="lblAddtitle"></asp:Label>
            </td>
            <td style="text-align: left">
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="auto-style7" Height="21px" Width="177px"></asp:TextBox> 
            </td>
        </tr>
    </table>
    <br />
    <div class="addButtonDiv">
            <asp:Button ID="addInvoice" runat="server" Text="Add To Invoice" Width="150px" CssClass="btnSave" OnClick="addInvoice_Click"/>
    </div>
&nbsp;<asp:GridView CssClass="Table" ID="tblInvoice" runat="server" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="invoice_id" HeaderText="#" SortExpression="invoice_id" InsertVisible="False" ReadOnly="True" ItemStyle-CssClass="idFont" />
            <asp:BoundField DataField="Party_Name" HeaderText="Party Name" SortExpression="Party_id" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" SortExpression="Product_id" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="Rate" HeaderText="Rate of Product" SortExpression="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="total" HeaderText="total" SortExpression="Total" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
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
    

    <div class="btnCloseDiv">
        <asp:Label ID="lblTotal" runat="server" Text="Grand Total : "></asp:Label>
        <asp:Label ID="txtTotal" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnCloseInvoice" CssClass="btnclose" runat="server" Text="Close Invoice" OnClick="btnCloseInvoice_Click" />
    </div>
</asp:Content>






