<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="O_Date" HeaderText="O_Date" SortExpression="O_Date" />
            <asp:BoundField DataField="O_Picture" HeaderText="O_Picture" SortExpression="O_Picture" />
            <asp:BoundField DataField="O_Status" HeaderText="O_Status" SortExpression="O_Status" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString %>" SelectCommand="SELECT [O_Date], [O_Picture], [O_Status] FROM [Order]"></asp:SqlDataSource>
</asp:Content>

