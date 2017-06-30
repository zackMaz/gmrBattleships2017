using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Battleships2017WebApi
{
    public static class ExtensionMethods
    {
        public static int ToInt(this object o)
        {
            return int.Parse(o.ToString());
        }

        public static int? ToNullableInt(this object o)
        {
            if (string.IsNullOrEmpty(o.ToString()))
            {
                return null;
            }
            else
            {
                return int.Parse(o.ToString());
            }
        }

        public static DateTime ToDateTime(this object o)
        {
            return DateTime.Parse(o.ToString());
        }
    }
}