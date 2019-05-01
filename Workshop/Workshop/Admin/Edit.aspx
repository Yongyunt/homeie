<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <h2>ชื่อลูกค้า</h2>
        <asp:Label runat="server" Text='<%# Eval("O_ID") %>'  ID="c_f"/></asp:Label>
            <h2>Address</h2>
        <asp:Label runat="server" Text='<%# Eval("C_Address") %>'  ID="c_a"/></asp:Label>
            <h2>ชื่อต้น</h2>
        <asp:Label runat="server" Text='<%# Eval("C_Firstname") %>'  ID="c_ff"/></asp:Label>
            <h2>ชื่อรอง</h2>
        <asp:Label runat="server" Text='<%# Eval("C_Lastname") %>'  ID="c_l"/></asp:Label>
             <h2>สถานะ</h2>
        <asp:Label runat="server" Text='<%# Eval("O_Status") %>'  ID="o_s"/></asp:Label>
            <h2>วันที่</h2>
        <asp:Label runat="server" Text='<%# Eval("O_Date") %>'  ID="o_d"/></asp:Label>
            <h2>เบอร์โทร</h2>
        <asp:Label runat="server" Text='<%# Eval("C_Phone") %>'  ID="Label1"/></asp:Label>
        </ItemTemplate>
    </asp:ListView>
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1"  runat="server"> 
        <asp:ListItem>ยกเลิก</asp:ListItem>
        <asp:ListItem>เสร็จแล้ว</asp:ListItem>
        <asp:ListItem>ได้รับสินค้าแล้ว</asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table">
        <Columns>
            <asp:BoundField DataField="O_ID" HeaderText="O_ID" SortExpression="O_ID" />
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="S_Name" HeaderText="S_Name" SortExpression="S_Name" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString3 %>" SelectCommand="SELECT         O_ID,Product.P_Name, Service.S_Name, Order_Product.Amount,MId.Price
FROM            MId INNER JOIN
                         Product ON MId.P_ID = Product.P_ID INNER JOIN
                         Order_Product ON Product.P_ID = Order_Product.P_ID AND Product.P_ID = Order_Product.P_ID INNER JOIN
                         Service ON MId.S_ID = Service.S_ID AND Order_Product.S_ID = Service.S_ID
where O_ID = @O_ID">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="O_ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="บันทึก" OnClick="Button1_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString3 %>" SelectCommand="SELECT        Customers.C_Address, Customers.C_Phone, [Order].O_Status, [Order].O_Date, Customers.C_ID, Customers.C_Firstname, Customers.C_Lastname, [Order].O_ID
FROM            [Order] INNER JOIN
                         Customers ON [Order].C_ID = Customers.C_ID
where [Order].O_ID = @O_ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="O_ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
        
          
