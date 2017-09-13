<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ShoppingWebsite.CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Product_Id" DataSourceID="SqlDataSource1" ShowFooter="True" Width="650px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Product_Id" HeaderText="Product_Id" ReadOnly="True" SortExpression="Product_Id" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [Product_Id] = @Product_Id" InsertCommand="INSERT INTO [Products] ([Product_Id], [Product_Name], [Price], [Quantity]) VALUES (@Product_Id, @Product_Name, @Price, @Quantity)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [Product_Name] = @Product_Name, [Price] = @Price, [Quantity] = @Quantity WHERE [Product_Id] = @Product_Id">
            <DeleteParameters>
                <asp:Parameter Name="Product_Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Product_Id" Type="String" />
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Product_Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Home" runat="server" OnClick="Home_Click" Text="Home" />

    </form>
</body>
</html>
