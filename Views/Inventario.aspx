<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage.master" AutoEventWireup="true" CodeFile="Inventario.aspx.cs" Inherits="Views_Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


<center><h1>Inventario</h1></center>
    <center>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Cantidad: "></asp:Label>
            <asp:TextBox ID="txt_cantidad" runat="server"></asp:TextBox>                  
            <asp:RegularExpressionValidator ID="validadorCantidadEnterosInventarios"
                 runat="server" 
                Display="Dynamic"
                ErrorMessage="Debe ser cantidad" 
                ControlToValidate="txt_cantidad" 
                ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
        </div>
        <div>
            <asp:Button ID="btn_actualizar" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click"></asp:Button>
        </div>
    </center>

</asp:Content>

