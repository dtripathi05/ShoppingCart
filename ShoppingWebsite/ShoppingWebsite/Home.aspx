<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShoppingWebsite.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="AddToCart" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="Gainsboro" />
                <Columns>
                    <asp:BoundField  DataField="Product_Id" HeaderText="Product_Id" />
                    <asp:BoundField  DataField="Product_Name" HeaderText="Product_Name" />
                    <asp:BoundField  DataField="Price" HeaderText="Price" SortExpression="Float" />
                    <asp:BoundField  DataField="Quantity" HeaderText="Quantity" SortExpression="int" />
                    <asp:TemplateField HeaderText="AddToCart">
                        <ItemTemplate>
                            <asp:Button Text="MoveToCart" runat="server" CommandName="MoveToCart" CommandArgument="<%#Container.DataItemIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Height="33px" OnClick="Btn_GoToCart" Text="ViewCart" Width="151px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AdminLogIn" runat="server" OnClick="Btn_AdminLogIn" Text="AdminLogin" />
    </form>
</body>
</html>
