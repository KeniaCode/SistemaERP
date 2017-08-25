using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Inventario : System.Web.UI.Page
{
    SqlConnection conexion;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_actualizar_Click(object sender, EventArgs e)
    {
        int codigoProducto = Convert.ToInt32(DropDownList1.SelectedItem.Value);

        Console.WriteLine(codigoProducto);
        int cantidad = Convert.ToInt32(txt_cantidad.Text);

        if ( cantidad> 0) {

            conexion = new SqlConnection();
            conexion.ConnectionString = "Data Source=TOSH-PC;Initial Catalog=proyecto_ayd1;Integrated Security=True";

            try
            {
                conexion.Open();
                SqlCommand query1 = new SqlCommand("SELECT CANTIDAD FROM PRODUCTO WHERE ID = " + codigoProducto, conexion);
                SqlDataReader registro = query1.ExecuteReader();
                string val = "";
                if (registro.Read())
                {
                    val = registro["cantidad"].ToString();
                }
                registro.Close();
                SqlCommand query = conexion.CreateCommand();
                query.CommandType = CommandType.Text;
                int total = Convert.ToInt32(val) + Convert.ToInt32(txt_cantidad.Text);
                query.CommandText = "UPDATE PRODUCTO SET CANTIDAD = " + total + " WHERE ID = " + codigoProducto;

                int fil = query.ExecuteNonQuery();

                if (fil > 0) { Console.WriteLine("error"); }

                ScriptManager.RegisterClientScriptBlock(this,
                                                        typeof(Page),
                                                        "anything",
                                                        "alert('La informacion ha sido actualizada !!!');",
                                                        true);

            }
            catch (Exception se)
            {
                Console.WriteLine(se);
            }
            finally
            {
                if (conexion.State != ConnectionState.Closed)
                {
                    conexion.Close();
                }
            }

        }
        else
        {

            Console.WriteLine("eror");
        }
        txt_cantidad.Text = "";
    }

    public Boolean cantidadAprobada(int n)
    {
        return n > 0;
    }


}