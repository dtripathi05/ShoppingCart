<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPlaced.aspx.cs" Inherits="ShoppingWebsite.OrderPlaced" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Order Has Been SuccessFully Placed"></asp:Label>
&nbsp;<br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Order Id For Tracking Order"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Btn_ContinueShopping" Text="Continue Shopping" />
    </form>
</body>
</html>
