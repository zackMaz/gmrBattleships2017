using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;
using Battleships2017WebApi.Models;
using System.Web.Http.Cors;

namespace Battleships2017WebApi.Controllers
{

    /// <summary>
    /// User-related functions
    /// </summary>

    [RoutePrefix("api/User")]
    [EnableCors("*", "*", "*")]
    public class UserController : ApiController
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

        

        /// <summary>
        /// registers a user
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>

        [HttpPost]
        [Route("Register")]
        public UserInfo Register([FromBody] string username)
        {
            if (string.IsNullOrWhiteSpace(username))
            {
                return null;
            }

            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_CreateUser", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@Username", username));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }

            DataRow row = table.Rows[0];

            return new UserInfo()
            {
                Username = row["Username"].ToString(),
                UserID = row["UserID"].ToInt()
            };

        }
    }
}
