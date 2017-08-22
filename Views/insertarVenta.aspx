<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPage.master" AutoEventWireup="true" CodeFile="insertarVenta.aspx.cs" Inherits="Views_insertarVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
      <!-- Content Wrapper. Contains page content -->
  
    <!-- Content Header (Page header) -->
    <h1>Ventas</h1>
    <!-- Main content -->

      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Cliente</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>Cliente</label><asp:DropDownList class="form-control select2" ID="dropDownListCliente" runat="server" DataSourceID="SqlDataSource2" OnClientClick="postback false;"  onChange="cambioscliente()"  DataTextField="nombre" DataValueField="nit">
                      <asp:ListItem></asp:ListItem>
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [nit], [nombre] FROM [Cliente]"></asp:SqlDataSource>

              </div>
             
              <!-- /.form-group -->
            </div>
           
            <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputPassword1">Nit</label>
                     <input type="text" class="form-control" id="NIT" name="NIT" placeholder="NIT" disabled>
 
                </div>
            </div>
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
       
      </div>
      <!-- /.box -->

    <!-- AREA DE VENTA -->
     <div class="box box-default">
        <div class="box-header with-border">
          <h3 class="box-title">Nueva Venta</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
                <div class="col-md-6">
                <div class="form-group">
                  <label>Unidades</label>
                  <input type="number" class="form-control" id="unidades" placeholder="Unidades">
                </div>
                </div>                 
            </div>
            <div class="col-md-6">
                <div class="col-md-6">
               <div class="form-group">
                <label>Producto</label>&nbsp;
                   <asp:DropDownList  class="form-control select2" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id">
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [nombre], [id], [precio], [cantidad], [descripcion] FROM [Producto]"></asp:SqlDataSource>
              </div>
              </div>                 
            </div>
            <div class="col-md-6">
                <div class="col-md-6">
                <div class="form-group">
                  <label>Descripcion</label>
                  <input type="text" class="form-control" id="descripcion" placeholder="Descripcion">
                </div>
                </div>                 
            </div>
          </div>
          <!-- /.row -->
            <div class="box-footer">
                <button type="submit" id="add-prod" name="add-prod" class="btn btn-primary">Agregar Producto</button>
              </div>
        </div>
        <!-- /.box-body -->
       
      </div>
      <!-- /.box -->
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentJS" Runat="Server">

    <script type="text/javascript">

        function cambioscliente()
        {
            var ddlReport = document.getElementById("<%=dropDownListCliente.ClientID%>");
            var Value = ddlReport.options[ddlReport.selectedIndex].value;
            document.getElementById("NIT").value = Value;
      
        }
        </script>

</asp:Content>