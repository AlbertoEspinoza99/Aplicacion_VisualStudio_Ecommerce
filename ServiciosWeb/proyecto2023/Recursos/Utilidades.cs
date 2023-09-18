using System.Security.Cryptography;
using System.Text;

namespace proyecto2023.Recursos
{
    public class Utilidades
    {

        public static string EncriptarClave(string clave)
        {

            StringBuilder sb = new StringBuilder();

            using(SHA256 hash = SHA256Managed.Create()) {
            
                Encoding enc = Encoding.UTF8;

                byte[] result =hash.ComputeHash(enc.GetBytes(clave));

                foreach(byte b in result)
                {
                    sb.Append(b.ToString("x2")); //indica que la cadena debe formatearse de una manera exagesimal

                }


            }

            return sb.ToString();


        }








    }
}
