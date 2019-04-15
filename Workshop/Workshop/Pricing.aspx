<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pricing.aspx.cs" Inherits="Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        service
    </h1>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-dark" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            
            
            <asp:TemplateField HeaderText="จำนวน">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="บริการ">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>ซํก</asp:ListItem>
                        <asp:ListItem>ซัก&amp;รีด</asp:ListItem>
                        <asp:ListItem>รีด</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="btn btn-success" PostBackUrl='<%# Eval("P_Name","Order.aspx?P_Name={0}") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            
            
        </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString2 %>" SelectCommand="SELECT [P_Name], [Price] FROM [Product]"></asp:SqlDataSource>
    </asp:Content>

