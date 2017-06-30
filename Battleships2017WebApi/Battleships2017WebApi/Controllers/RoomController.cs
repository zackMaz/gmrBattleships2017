using Battleships2017WebApi.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Battleships2017WebApi.Controllers
{

    [RoutePrefix("api/Room")]
    [EnableCors("*", "*", "*")]
    public class RoomController : ApiController
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

        [HttpPost]
        [Route("Create")]
        public RoomCredentials Create(CreateRoom roomInfo)
        {
            if (string.IsNullOrWhiteSpace(roomInfo.RoomName))
            {
                return null;
            }


            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_CreateRoom", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@RoomName", roomInfo.RoomName));
                command.Parameters.Add(new SqlParameter("@HostID", roomInfo.HostID));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();


            }

            DataRow row = table.Rows[0];

            return new RoomCredentials()
            {
                RoomName = row["RoomName"].ToString(),
                RoomID = row["RoomID"].ToInt()
            };

        }


        [HttpPost]
        [Route("Join")]
        public bool Join(EditRoom roomInfo)
        {



            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_JoinRoom", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@RoomID", roomInfo.RoomID);
                command.Parameters.AddWithValue("@GuestID", roomInfo.GuestID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();



                if (table.Rows.Count > 0 && table.Rows[0][0].ToString() == "Invalid")
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }

        }


        [HttpGet]
        [Route("GetUsers")]
        public RoomUsers GetUsers(int RoomID)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_GetRoomUsers", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@RoomID", RoomID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }



            var roomUsers = new RoomUsers
            {
                HostName = table.Rows[0]["Username"].ToString(),
                GuestName = table.Rows[1]["Username"].ToString()
            };

        }


        [HttpPost]
        [Route("Leave")]
        public void Leave(int RoomID)
        {


            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_LeaveRoom", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@RoomID", RoomID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }
        }



        [HttpGet]
        [Route("Display")]
        public List<RoomInfo> Display(int pageNumber, int pageSize = 10)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_GetRooms", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PageNumber", pageNumber);
                command.Parameters.AddWithValue("@PageSize", pageSize);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }

            var roomInfos = (from DataRow row in table.Rows
                             select new RoomInfo()
                             {
                                 RoomName = row["RoomName"].ToString(),
                                 Username = row["Username"].ToString(),
                                 CreationDate = row["CreationDate"].ToDateTime()
                             });


            return roomInfos.ToList();


        }


        [HttpGet]
        [Route("GetStatus")]
        public int GetStatus(int RoomID)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_GetStatus", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@RoomID", RoomID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }

            DataRow row = table.Rows[0];

            int GameStatus = row["GameStatusID"].ToInt();

            return GameStatus;
        }
    }





}
