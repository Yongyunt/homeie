<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Order
    </h1>
    
    
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString %>" DeleteCommand="DELETE FROM Product WHERE (P_ID = @P_ID)" SelectCommand="SELECT [P_ID], [P_Type], [P_Name] FROM [Product]"></asp:SqlDataSource>
   
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
   
</asp:Content>

