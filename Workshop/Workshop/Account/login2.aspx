<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login2.aspx.cs" Inherits="login2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <p>
</p>
<br />
<table style="width: 100%;">
    <tr>
        <td style="height: 32px; width: 217px">Username</td>
        <td style="height: 32px">
            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height: 32px; width: 217px">Password</td>
        <td style="height: 32px">
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 217px">&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" CssClass="btn btn-dark" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </td>
    </tr>
</table>

</asp:Content>

