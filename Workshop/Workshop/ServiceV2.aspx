<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ServiceV2.aspx.cs" Inherits="Service_reed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
    Menu
    </h1> 
    <asp:Label ID="Label2" runat="server" Text="ซัก"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="P_ID,S_ID" DataSourceID="SqlDataSource1" CssClass="table table-dark">
        <Columns>
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="S_Name" HeaderText="S_Name" SortExpression="S_Name" />
          
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
          
            <asp:TemplateField HeaderText="จำนวน">
                <ItemTemplate>
                    <asp:TextBox ID="txtcal" runat="server" Text="0" TextMode="Number" ></asp:TextBox>
                      <asp:HiddenField ID="HFID" runat="server" 
            Value='<%# Eval("P_ID") %>' />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
    <div class ="text-right">
    
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="คำนวณ" />
    
    <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SuckreedConnectionString3 %>" SelectCommand="SELECT        MId.Price, Product.P_Name, Service.S_Name, MId.P_ID, MId.S_ID
	FROM            MId INNER JOIN
                         Product ON MId.P_ID = Product.P_ID INNER JOIN
                         Service ON MId.S_ID = Service.S_ID
WHERE        (MId.S_ID = @S_ID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="S_ID" QueryStringField="S_ID" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server"></asp:GridView>
</asp:Content>
