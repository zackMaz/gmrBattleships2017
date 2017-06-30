'use strict';

document.body.onload = function () {
    //setInterval(update, 500);
    RoomNameLabel.textContent = sessionStorage["RoomName"];
    CompetitorsLabel.textContent = sessionStorage["HostName"] + " vs " + sessionStorage["GuestName"];
};