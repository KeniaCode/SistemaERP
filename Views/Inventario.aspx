<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage.master" AutoEventWireup="true" CodeFile="Inventario.aspx.cs" Inherits="Views_Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


<center><h1>Inventario</h1>
    <p>
        <table>
            <tr>
                <td>&nbsp;</td>
                <td>Seleccione el Producto ...</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=TOSH-PC;Initial Catalog=proyecto_ayd1;Integrated Security=True" SelectCommand="SELECT [id], [nombre] FROM [producto]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p></center>
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

