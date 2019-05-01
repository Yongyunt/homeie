<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Notification
    </h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table" >
        <Columns>
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="S_Name" HeaderText="S_Name" SortExpression="S_Name" />
            <asp:BoundField DataField="O_Date" HeaderText="O_Date" SortExpression="O_Date" />
            <asp:BoundField DataField="O_Status" HeaderText="O_Status" SortExpression="O_Status" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString3 %>" SelectCommand="SELECT           Product.P_Name, Service.S_Name, [Order].O_Date,[Order].O_Status,Order_Product.Amount,MId.Price
FROM            [Order] INNER JOIN
                         Order_Product ON [Order].O_ID = Order_Product.O_ID INNER JOIN
                         Product ON Order_Product.P_ID = Product.P_ID AND Order_Product.P_ID = Product.P_ID INNER JOIN
                         MId ON Product.P_ID = MId.P_ID INNER JOIN
                         Service ON Order_Product.S_ID = Service.S_ID AND MId.S_ID = Service.S_ID INNER JOIN
                         Customers ON [Order].C_ID = Customers.C_ID
where Customers.C_ID = @C_ID">
        <SelectParameters>
            <asp:SessionParameter Name="C_ID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

