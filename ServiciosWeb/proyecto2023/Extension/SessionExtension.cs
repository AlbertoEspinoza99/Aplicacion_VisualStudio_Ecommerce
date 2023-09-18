
using Azure.Core.Serialization;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;  //esto es para la session 

 



namespace proyecto2023.Extension
{
    public static class SessionExtension
    {


        public static void SetObject(this ISession session, String key, object value)
        {

            String data =JsonConvert.SerializeObject(value);
            
            session.SetString(key, data);
        }


        public static T GetObject<T>(this ISession session, String key)
        {

            String data= session.GetString(key);
            if(data == null) 
            {
                return default(T);
            }
            return JsonConvert.DeserializeObject<T>(data);  

        }




    }
}
