using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Battleships2017WebApi.Models
{
    public class RoomInfo
    {
        public string RoomName { get; set; }
        public string Username { get; set; }
        public DateTime CreationDate { get; set; }
    }
}