using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Inventario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_actualizar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this,
            typeof(Page),
            "anything",
            "alert('La informacion ha sido actualizada !!!');",
            true);
        txt_cantidad.Text = "";
    }
}