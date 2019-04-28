<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Menu
    </h1>
    <div class="text-center">
    <asp:Button ID="Suck" runat="server" Text="ซัก" CssClass="btn btn-warning btn-lg " OnClick="Suck_Click" />
        <asp:Button ID="reed" runat="server" Text="รีด" CssClass="btn btn-success btn-lg " OnClick="reed_Click" />
        <asp:Button ID="Suckandreed" runat="server" Text="ซัก&amp;รีด" CssClass="btn btn-danger btn-lg " OnClick="Suckandreed_Click" />
    </div>
</asp:Content>

