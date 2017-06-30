'use strict'

function createUser()
{
    

    postRequest(baseUrl + "User/Register", usernameTextBox.value,(result) => {
        sessionStorage["Username"] = result.Username;
        sessionStorage["UserID"] = result.UserID;

        location.href = "rooms.html";
    });
}