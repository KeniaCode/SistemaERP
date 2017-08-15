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
                <label>Cliente</label>
                <select class="form-control select2" style="width: 100%;">
                  <option selected="selected">Omar Mendez</option>
                  <option>Juan Jose</option>
                  <option>Andres Ronaldo</option>
                  <option>Maria Andrea</option>
                  <option>Ricardo Pelaez</option>
                  <option>Luis Perez</option>
                  <option>Catalina Anastasia</option>
                </select>
              </div>
             
              <!-- /.form-group -->
            </div>
           
            <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputPassword1">Nit</label>
                  <input type="number" class="form-control" id="nit" placeholder="Nit Cliente" disabled>
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
                <label>Producto</label>
                <select class="form-control select2" style="width: 100%;">
                  <option selected="selected">Martillo</option>
                  <option>Serrucho</option>
                  <option>Lija 200</option>
                  <option>Lija 300</option>
                  <option>Silicon</option>
                  <option>Tornillos 3/4</option>
                  <option>Destornillador Philips</option>
                </select>
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

