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
                <asp:TemplateField HeaderText="Product_Id" SortExpression="Product_Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Product_Id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" OnClick="lbInsert_Click">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product_Name" SortExpression="Product_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Product_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ErrorMessage="Name Is a Required Field"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="TextName" runat="server" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvInsertName" ValidationGroup="Insert" runat="server" ErrorMessage="Name Is a Required Field"
                            ControlToValidate="TextName" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvEditPrice" runat="server" ErrorMessage="Price Is a Required Field"
                            ControlToValidate="TextBox2" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="TextPrice" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvInsertPrice" ValidationGroup="Insert" runat="server" ErrorMessage="Price Is a Required Field"
                            ControlToValidate="TextPrice" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvEditQuantity" runat="server" ErrorMessage="Quantity Is a Required Field"
                            ControlToValidate="TextBox3" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="TextQuantity" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="rfvInsertQuantity" ValidationGroup="Insert" runat="server" ErrorMessage="Quantity Is a Required Field"
                            ControlToValidate="TextQuantity" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
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
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert" runat="server" ForeColor="Red" />
         <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [Product_Id] = @Product_Id" 
            InsertCommand="INSERT INTO [Products] ( [Product_Name], [Price], [Quantity]) VALUES ( @Product_Name, @Price, @Quantity)"
            SelectCommand="SELECT * FROM [Products]" 
            UpdateCommand="UPDATE [Products] SET [Product_Name] = @Product_Name, [Price] = @Price, [Quantity] = @Quantity WHERE [Product_Id] = @Product_Id">
            <DeleteParameters>
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
               
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Home" runat="server" OnClick="Btn_Home_Click" Text="Home" />

    </form>
</body>
</html>
