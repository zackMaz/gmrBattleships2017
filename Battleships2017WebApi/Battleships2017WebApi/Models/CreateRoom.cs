using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Battleships2017WebApi.Models
{
    public class CreateRoom
    {
        public string RoomName { get; set; }
        public int HostID { get; set; }
    }
}