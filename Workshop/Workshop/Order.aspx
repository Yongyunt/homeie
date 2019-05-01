<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Order
    </h1>
    <br />
    <asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="Red" ForeColor="Red" Text="โปรดเลือกวันที่"></asp:Label>



    <br />
    <asp:TextBox ID="TextBox1" TextMode="Date" runat="server"></asp:TextBox>



    <br />

    <asp:Label ID="Label3" runat="server" Text="ซัก"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server"  CommandName="Delete" CommandArgument='<%# Eval("P_ID") %>' CssClass="btn btn-danger" Text="Delete" />
                    <asp:HiddenField ID="HFID" runat="server" Value='<%# Eval("P_ID") %>' />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <asp:Label ID="Label4" runat="server" Text="รีด"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped" OnRowCommand ="GridView2_RowCommand" AutoGenerateColumns="false" OnRowDeleting ="GridView2_RowDeleting" >
        <Columns>
            <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
             <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server"  CommandName="Delete" CommandArgument='<%# Eval("P_ID") %>' CssClass="btn btn-danger" Text="Delete" />
                    <asp:HiddenField ID="HFID" runat="server" 
            Value='<%# Eval("P_ID") %>' />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   
    <asp:Label ID="Label5" runat="server" Text="ซัก&amp;รีด"></asp:Label>
    <br />
    <asp:GridView ID="GridView3" runat="server" CssClass="table table-striped" OnRowCommand ="GridView3_RowCommand" AutoGenerateColumns="false" OnRowDeleting ="GridView3_RowDeleting"  >
        <Columns>
             <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
             <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server"  CommandName="Delete" CommandArgument='<%# Eval("P_ID") %>' CssClass="btn btn-danger" Text="Delete" />
                    <asp:HiddenField ID="HFID" runat="server" 
            Value='<%# Eval("P_ID") %>' />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />

    <div class ="text-right">
        

        
     <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-dark" OnClick="Button2_Click"  />
       
        <br /> 
    </div>
     <div class ="text-right">
      <asp:Label ID="Label2" runat="server"></asp:Label> 
    </div>

</asp:Content>

