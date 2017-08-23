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
                <label>Cliente</label><asp:DropDownList class="form-control select2" OnChange="cambiocliente()" ID="dropDownListCliente" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="nit">
                      <asp:ListItem></asp:ListItem>
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [nit], [nombre] FROM [Cliente]"></asp:SqlDataSource>

              </div>
             
              <!-- /.form-group -->
            </div>
           
            <div class="col-md-6">
                <div class="form-group">
                  <label >Nit</label>
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
                  <input type="number" class="form-control" id="txtcantidad" placeholder="Unidades">
                </div>
                </div>                 
            </div>
            <div class="col-md-6">
                <div class="col-md-6">
               <div class="form-group">
                <label>Producto</label>&nbsp;
                   <div id="productos" class="span6"  runat="server">
                    </div>
              </div>
              </div>                 
            </div>
            <div class="col-md-6">
                <div class="col-md-6">
                <div class="form-group">
                  <label>Descripcion</label>
                    <textarea class="form-control" id="descripcion" placeholder="Descripcion" rows="3" disabled></textarea>
                </div>
                </div>
                <div class="col-md-6">
                                                    <label class="control-label" style="font-size: 15px;"><b>Cantidad Disponible</b></label>
                                                     <div class="align-left">
                                                         <input type="text" class="form-control" style="font-size: 13px;" name="regular" readonly="readonly" class="span3" id="disponible"  />
                                                     </div>                                                   
                </div>
                                
            </div>
                                        
          </div>
          <!-- /.row -->
            <div class="box-footer">
                <button type="submit" onClick ="return false;" id="agregar" name="agregar"  class="btn btn-primary">Agregar Producto</button>
              </div>

             <input  type="text" name="regular" readonly="readonly" class="span1" id="idventa" hidden="hidden"/>
                                   
            <div class="control-group" id="detalleproductos">


            </div>
	                              
	                                <div class="form-actions align-right">
	                                    <button type="submit" id="comprar" name="comprar" onClick="modalpago()" class="btn btn-primary">Aceptar</button>
	                                    <button type="reset" id="cleancarrito" class="btn">Limpiar</button>
	                                </div>
        </div>
        <!-- /.box-body -->
       
      </div>
    

      <!-- /.box -->
         <!-- MODAL PARA AGREGAR CLIENTES CLIENTES-->
            <div id="divmodal" runat="server">
    
            </div>
            
            <div id="divpago" runat="server">
    
            </div>
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentJS" Runat="Server">

    <script type="text/javascript">

        function cambiocliente() {
            
            var ddlReport = document.getElementById("<%=dropDownListCliente.ClientID%>");
            var Value = ddlReport.options[ddlReport.selectedIndex].value;
            document.getElementById("NIT").value = Value;

        };

        //Mostrar modal de pago
         function modalpago() { // modal pago
        
              var ddlReport = document.getElementById("<%=dropDownListCliente.ClientID%>");
            var client = ddlReport.options[ddlReport.selectedIndex].value;
             alert(client)
            if (client != "") {

                $.ajax({
                    type: 'POST',
                    url: 'insertarVenta.aspx/MostrarModalPago',
                    data: JSON.stringify({ cliente: client }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        if (response.d == '0') {
                            alert('Carrito Vacío');
                        } else {


                            //se escribe el modal
                            var $modal = $('#ContentPlaceHolder1_divpago');

                            $modal.html(response.d);
                            $('#ModalPago').on('show.bs.modal', function () {
                                $('.modal .modal-body').css('overflow-y', 'auto');
                                $('.modal .modal-body').css('max-height', $(window).height() * 0.7);
                                $('.modal .modal-body').css('height', $(window).height() * 0.7);
                            });

                            //Modal
                            $('#formulario_modal')[0].reset(); //formulario lo inicializa con datos vacios
                            $('#pro_modal').val('Registro'); //crea nuestra caja de procesos y se agrega el valor del registro
                            $('#reg_modal').show(); //mostramos el boton de registro
                            $('#edi_modal').hide();//se esconde el boton de editar
                            $('#ModalPago').modal({ //
                                show: true, //mostramos el modal registra producto
                                //backdrop: 'static' //hace que no se cierre el modal si le dan clic afuera del mismo.
                            });
                        }
                    }
                });
            } else {
                alert("Debe elegir un cliente primero!!");
            }

        }



        $('#agregar').on('click', function () {


            var cod = $("#cmbproductos").val();
            var nombre = $("#cmbproductos  option:selected").text();
            var cant = $("#txtcantidad").val();
            
            var disp = $("#disponible").val();
         
            var idventa = parseFloat(1);
            var venta = $("#idventa").val();
            if (venta == "") {
                document.getElementById("idventa").value = idventa;

            } else {
                document.getElementById("idventa").value = parseFloat(venta) + parseFloat(1);
            }

            var cantidad = parseInt(cant)
            var disponi = parseInt(disp)
            alert(cantidad)
            alert(disponi)
           
            if (cant <= disponi) {
          
                var disponible = $("#disponible").val() - cant;
                document.getElementById("disponible").value = disponible;
          
                var iventa = $("#idventa").val();
                $.ajax({
                    type: 'POST',
                    url: 'insertarVenta.aspx/AddProducto',
                    data: JSON.stringify({ idventa: iventa, producto: nombre, cantidad: cant, codigo: cod }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (msg) {
                        $("#txtcantidad").val("");
                        $("#txtmetros").val("");
                        $("#txtcantidad").focus();
                        $("#detalleproductos").html(msg.d);
                        alert(msg.d);
                    }
                });

            } else {
                alert("La cantidad que desea vender excede a la disponible");
            }

        });

        function cambios() {

            var id = document.getElementById('cmbproductos').value;
            var selected = $("#cmbproductos  option:selected").text();

            $.ajax({
                type: 'POST',
                url: 'insertarVenta.aspx/Busca_Datos',
                data: JSON.stringify({ id: id }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {

                    var produc = JSON.parse(response.d);
                    var Descripcion = produc[0];
                    var Cantidad_Dispo = produc[1];
                    var NombreCategoria = produc[2];
                    var Precio = produc[3];



                    document.getElementById("disponible").value = Cantidad_Dispo;

                    document.getElementById("descripcion").value = Descripcion;
                    

                }
            });

        }





        </script>

</asp:Content>