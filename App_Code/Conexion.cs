using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Descripción breve de Conexion
/// </summary>
public class Conexion
{
    private string mostrarError;
 
    SqlConnection conexion = new SqlConnection();

        



        public string MostrarError
    {
        get { return mostrarError; }
        set { mostrarError = value; }
    }


    private bool ConectarServer()
    {
        bool respuesta = false;
        //JARVIS\SQLEXPRESS
        string cadenaConexion = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        //string cadenaConexion = @"Data Source=192.168.1.6;Initial Catalog=PROYECT_1;User ID=sa;Password=Proteccionsolar123";
        //Data Source=DESKTOP-NG22G5J\SQLEXPRESS;Initial Catalog=PROYECT_1;Integrated Security=True
        try
        {

            conexion.ConnectionString = cadenaConexion;
            conexion.Open();
            respuesta = true;


        }
        catch (Exception ex)
        {
            respuesta = false;
            MostrarError = "No se ha podido conectado con el servidor. Mensaje de la excepción: " + ex.Message.ToString();
        }
        return respuesta;
    }




    public bool Crear(string tabla, string campos, string valores)
    {
        bool respuesta = false;

        try
        {
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            //INSERT INTO DEPARTAMENTO(nombre_depto) VALUES('Guatemala');
            comando.CommandText = "INSERT INTO " + tabla + "(" + campos + ") VALUES(" + valores + ");";
            if (ConectarServer())
            {
                if (comando.ExecuteNonQuery() == 1)
                    respuesta = true;
                else
                    respuesta = false;
            }
            else
            {
                respuesta = false;
            }
        }
        catch (Exception ex)
        {
            respuesta = false;
            MostrarError = "Mensaje de la excepcion: " + ex.Message.ToString();
        }
        finally
        {
            conexion.Close();
        }
        return respuesta;
    }

    public DataSet Consulta(string query)
    {
        DataSet respuesta = new DataSet();
        try
        {
            //SELECT cod_depto, nombre_depto FROM DEPARTAMENTO;
            SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion);

            if (ConectarServer())
            {
                adaptador.Fill(respuesta);
            }
        }
        catch (Exception ex)
        {
            MostrarError = "Mensaje de la exepción: " + ex.Message.ToString();
        }
        finally
        {
            conexion.Close();
        }

        return respuesta;
    }


    public DataSet Buscar_Mostrar(string tabla, string condicion)
    {
        DataSet respuesta = new DataSet();
        try
        {
            string instruccionSQL = "SELECT * FROM " + tabla + " WHERE " + condicion + ";";
            SqlDataAdapter adaptador = new SqlDataAdapter(instruccionSQL, conexion);

            if (ConectarServer())
            {
                adaptador.Fill(respuesta, condicion);
            }
        }
        catch (Exception ex)
        {
            MostrarError = "Mensaje de la exepción: " + ex.Message.ToString();
        }
        finally
        {
            conexion.Close();
        }

        return respuesta;
    }




}


