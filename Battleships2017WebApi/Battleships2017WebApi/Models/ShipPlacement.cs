using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Battleships2017WebApi.Models
{
    public class ShipPlacement
    {

        public int CellID { get; set; }
        public int DirectionID { get; set; }
        public int ShipID { get; set; }

    }
}