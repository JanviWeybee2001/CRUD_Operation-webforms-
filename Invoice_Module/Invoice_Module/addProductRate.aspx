<%@ Page Title="" Language="C#" MasterPageFile="~/Invoice_Module.Master" AutoEventWireup="true" CodeBehind="addProductRate.aspx.cs" Inherits="Invoice_Module.addProductRate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Theme1/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Product Rate Add
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:Label ID="lblProductRateSts" runat="server" CssClass="lblStatus"></asp:Label>
</asp:Content>

<asp:Content ID="Content8" runat="server" contentplaceholderid="ContentPlaceHolder2">
    
        <table class="auto-style3">
            <colgroup>
                <col style="width:50%" />
                <col style="width:50%" />
            </colgroup>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="lblProduct" runat="server" Text="Product Name : " CssClass="lblAddtitle"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="slctProduct" runat="server" CssClass="txtAddfield" DataSourceID="SqlDataSource1" DataTextField="Product_Name" DataValueField="Product_Name"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Party_Product %>" SelectCommand="SELECT [Product_Name] FROM [Product_List]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="lblRate" runat="server" Text="Product Rate : " CssClass="lblAddtitle"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtRate" runat="server" CssClass="txtAddfield" Height="26px"></asp:TextBox> 
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="lblDate" runat="server" Text="Date of Rate : " CssClass="lblAddtitle"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:Calendar ID="calDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" SelectedDate="09/05/2022 10:54:38">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                </td>
            </tr>
        </table>
    
        <div class="addButtonDiv">
            <asp:Button ID="SaveProductRateItems" runat="server" Text="Save" Width="80px" CssClass="btnSave" OnClick="SaveProductRateItems_Click"/>
            <asp:LinkButton ID="CancelProductRateItems" runat="server" CssClass="btnCancle" PostBackUrl="~/ProductRate.aspx">Cancel</asp:LinkButton>
        </div>
</asp:Content>

<%--
<div class="addDiv">
        <div class="addtxtDiv">       
            
            </div>
        <div class="addtxtDiv">       
                 
        </div>
        <div class="addtxtDiv">       
            
            <div class="addtxtDiv">  
                
            </div>
        </div>--%>