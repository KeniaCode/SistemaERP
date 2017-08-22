using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_insertarCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAgregarCliente_Click(object sender, EventArgs e)
    {
        Conexion.Crear("CLIENTE", "localdb","" );


    }
}