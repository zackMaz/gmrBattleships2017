using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Battleships2017WebApi.Controllers;
using Battleships2017WebApi.Models;
using System.Web.Http;
using System.Collections.Generic;

namespace Battleships2017WebApi.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void RegisterTest()
        {
            UserController controller = new UserController();
            var userInfo = controller.Register("Zack");
            Assert.IsNotNull(userInfo, "Invalid Login");
            Assert.IsNotNull(userInfo.Username, "no username");
        }

        [TestMethod]
        public void CreateRoomTest()
        {
            RoomController controller = new RoomController();
            CreateRoom room = new CreateRoom
            {
                RoomName = "TestRoom",
                HostID = 4
            };

            var roomInfo = controller.Create(room);
            Assert.IsNotNull(roomInfo);
        }


        [TestMethod]
        public void JoinRoomTest()
        {
            RoomController controller = new RoomController();
            EditRoom room = new EditRoom
            {
                RoomID = 7,
                GuestID = 5
            };

            var roomInfo = controller.Join(room);
            Assert.IsTrue(roomInfo);
        }


        [TestMethod]
        public void LeaveRoomTest()
        {
            RoomController controller = new RoomController();
            int roomInfo = 6;
            controller.Leave(roomInfo);
        }

        [TestMethod]
        public void CreateBoardTest()
        {
            GameController controller = new GameController();
            CreateBoard board = new CreateBoard
            {
                RoomID = 17,
                UserID = 14
            };
            var boardInfo = controller.Create(board);
            Assert.IsNotNull(board);
        }

        [TestMethod]
        public void GetCellsTest()
        {
            GameController controller = new GameController();

            int BoardID = 1;

            var cellInfo = controller.GetCells(BoardID);
            Assert.IsNotNull(cellInfo);

        }
    }
}
