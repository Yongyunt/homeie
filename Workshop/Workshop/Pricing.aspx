<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pricing.aspx.cs" Inherits="Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>service ซักรีด
    </h1>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-dark" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />


            <asp:TemplateField HeaderText="จำนวน">
                <ItemTemplate>
                    <asp:TextBox ID="txtcal" runat="server" Text="0" TextMode="Number"></asp:TextBox>
                    <br />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField></asp:TemplateField>


        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString3 %>" SelectCommand="SELECT        MId.Price, Product.P_Name, Service.S_Name, MId.P_ID, MId.S_ID
	FROM            MId INNER JOIN
                         Product ON MId.P_ID = Product.P_ID INNER JOIN
                         Service ON MId.S_ID = Service.S_ID
WHERE        (MId.S_ID = @S_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="S_ID" QueryStringField="S_ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="text-right">
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-dark" Text="คำนวณ" OnClick="Button1_Click1" />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-light" OnClick="Button2_Click" Text="Subimit" />
    </div>

    <br />
    ยอดรวม
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>

