<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Order
    </h1>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="P_ID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="P_ID" HeaderText="P_ID" InsertVisible="False" ReadOnly="True" SortExpression="P_ID" />
            <asp:BoundField DataField="P_Type" HeaderText="P_Type" SortExpression="P_Type" />
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" OnClientClick="return confirm('Are you sure?')"  runat="server" CausesValidation="False" CommandName="Delete" Text="ลบข้อมูล" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-danger" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString %>" DeleteCommand="DELETE FROM Product WHERE (P_ID = @P_ID)" SelectCommand="SELECT [P_ID], [P_Type], [P_Name] FROM [Product]"></asp:SqlDataSource>
   
</asp:Content>

