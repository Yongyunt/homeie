<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="A.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <asp:GridView ID="GridView1" Cssclass ="table" runat="server" AutoGenerateColumns="False" DataKeyNames="O_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="O_Status" HeaderText="O_Status" SortExpression="O_Status" />
            <asp:BoundField DataField="O_ID" HeaderText="O_ID" InsertVisible="False" ReadOnly="True" SortExpression="O_ID" />
            <asp:BoundField DataField="C_Firstname" HeaderText="C_Firstname" SortExpression="C_Firstname" />
            <asp:BoundField DataField="C_Lastname" HeaderText="C_Lastname" SortExpression="C_Lastname" />
            
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button IDq="Button1" CssClass="btn btn-outline-danger" runat="server" PostBackUrl='<%# Eval("O_ID","Edit.aspx?id={0}") %>' Text="View" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString2 %>" SelectCommand="SELECT       [Order].O_Status, [Order].O_ID, Customers.C_Lastname, Customers.C_Firstname
FROM            [Order] INNER JOIN
                         Customers ON [Order].C_ID = Customers.C_ID"></asp:SqlDataSource>
</asp:Content>

