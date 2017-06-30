using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Battleships2017WebApi.Models
{
    public class CellInfo
    {

        public int CellID { get; set; }
        public int CellX { get; set; }
        public int CellY { get; set; }
        public int StatusID { get; set; }
        public int BoardID { get; set; }
        public int RoomID { get; set; }
        public int UserID { get; set; }
        public int? ShipID { get; set; }

    }
}