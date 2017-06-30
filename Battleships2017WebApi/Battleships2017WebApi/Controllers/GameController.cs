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


    [RoutePrefix("api/Game")]
    [EnableCors("*", "*", "*")]
    public class GameController : ApiController
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

        [HttpPost]
        [Route("Create")]
        public BoardInfo Create([FromBody] CreateBoard createBoard)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_CreateBoard", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@RoomID", createBoard.RoomID));
                command.Parameters.Add(new SqlParameter("@UserID", createBoard.UserID));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }


            DataRow row = table.Rows[0];

            return new BoardInfo
            {
                RoomID = row["RoomID"].ToInt(),
                UserID = row["UserID"].ToInt(),
                BoardID = row["BoardID"].ToInt()
            };
        }


        [HttpGet]
        [Route("GetCells")]
        public List<CellInfo> GetCells(int BoardID)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_GetCells", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@BoardID", BoardID));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }


            var cellInfos = (from DataRow row in table.Rows
                             select new CellInfo()
                             {
                                 CellID = row["CellID"].ToInt(),
                                 CellX = row["X"].ToInt(),
                                 CellY = row["Y"].ToInt(),
                                 StatusID = row["StatusID"].ToInt(),
                                 BoardID = row["BoardID"].ToInt(),
                                 RoomID = row["RoomID"].ToInt(),
                                 UserID = row["UserID"].ToInt(),
                                 ShipID = row["ShipID"].ToNullableInt()
                             });

            return cellInfos.ToList();
        }


        [HttpPost]
        [Route("PlaceShip")]
        public List<ShipInfo> PlaceShip([FromBody] ShipPlacement shipPlacement)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_PlaceShip", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ShipID", shipPlacement.ShipID));
                command.Parameters.Add(new SqlParameter("@DirectionID", shipPlacement.DirectionID));
                command.Parameters.Add(new SqlParameter("@CellID", shipPlacement.CellID));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }


            var shipInfos = (from DataRow row in table.Rows
                             select new ShipInfo()
                             {
                                 ShipID = row["ShipID"].ToInt(),
                                 CellID = row["CellID"].ToInt(),
                                 StatusID = row["StatusID"].ToInt()
                             });

            return shipInfos.ToList();
        }



        [HttpPost]
        [Route("ResetShip")]
        public bool ResetShip([FromBody] ResetShip resetShip)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_ResetShip", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ShipID", resetShip.ShipID));
                command.Parameters.Add(new SqlParameter("@BoardID", resetShip.BoardID));
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }

            DataRow row = table.Rows[0];

            if (table.Rows.Count > 0 && table.Rows[0][0].ToString() == "Invalid")
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        [HttpPost]
        [Route("Attack")]
        public bool? Attack(int CellID)
        {
            DataTable table = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("usp_AttackCell", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue(@"CellID", CellID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                connection.Open();
                adapter.Fill(table);
                connection.Close();
            }


            DataRow row = table.Rows[0];

            if (row[0].ToString() == "Invalid")
            {
                return null;
            }
            else
            {
                return true;
            }

        }
    }
}
