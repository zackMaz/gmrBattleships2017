'use strict'


class Room {
    constructor(RoomName, Username, CreationDate) {
        this.RoomName = RoomName;
        this.Username = Username;
        this.CreationDate = CreationDate;
    }


    static loadRooms(postResult) {
        let rooms = [];
        postResult.forEach(function (room) {
            rooms.push(new Room(room.RoomName, room.Username, room.CreationDate))
        });

        return rooms;
    }
}

document.body.onload = function () {


    if (sessionStorage["Username"] === null || sessionStorage["UserID"] === null) {
        location.href = "index.html";
    }
}



function createRoom() {
    let roomInfo = {
        RoomName: roomnameTextBox.value,
        HostID: sessionStorage["UserID"]
    };

    postRequest(baseUrl + "Room/Create", roomInfo, (result) => {
        sessionStorage["RoomName"] = result.RoomName;
        sessionStorage["HostID"] = result.HostID;
        sessionStorage["HostName"] = sessionStorage["Username"];
        location.href = "game.html";
    });
}

getRequest(baseUrl + "Room/Display?pageNumber=1", (result) => {
    let rooms = Room.loadRooms(result);

    for (let room of rooms) {
        let a = document.createElement("a");
        let li = document.createElement("li");
        a.innerText = room.RoomName + " by " + room.Username + "  made on " + room.CreationDate;
        a.dataset.RoomName = room.RoomName;
        a.dataset.Username = room.Username;
        a.href = "#";
        a.addEventListener("click", joinRoom);
        li.appendChild(a);
        RoomsList.appendChild(li);
    }
});



function joinRoom(event) {
    let roomInfo = {
        RoomID: event.srcElement.dataset.RoomID,
        UserID: sessionStorage["UserID"]
    };


    getRequest(baseUrl + "Room/GetUsers", (result) => {
        sessionStorage["HostName"] = result.HostName;
        sessionStorage["GuestName"] = result.GuestName;
    });

    postRequest(baseUrl + "Room/Join", roomInfo, (result) => {
        if (result) {
            location.href = "game.html";
        }
        else {
            location.reload();
        }
    });
}








