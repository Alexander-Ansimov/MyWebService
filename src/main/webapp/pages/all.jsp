<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
        $(document).ready(function(){

            $("#submitUser").click(function (e) {
                e.preventDefault();
                var formData = toJSON($('#userForm').serialize());
                console.log(formData);
                $.ajax({
                    url: "/user",
                    type: "POST",
                    data: JSON.stringify(formData),
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        var tr = "<tr><td>" + data.id + "</td><td>" + data.firstName + "</td><td>" + data.lastName + "</td><td>" + data.describe + "</td></tr>";
                        $('#usersTable').append(tr);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });

            function toJSON(paramsString) {
                var sendedObject = {}, serialized = paramsString.split('&'), key, value;
                serialized.forEach(function (val) {
                    key = val.split('=')[0];
                    value = val.split('=')[1];
                    sendedObject[key] = value;
                });
                return sendedObject;
            }

        });
    </script>
    <title>Title</title>
</head>
<body>

<table id="usersTable" border="1">
    <tr>
        <td>id</td>
        <td>First name</td>
        <td>Last name</td>
        <td>Describe</td>
    </tr>
</table>
<br><br>

<form id="userForm">
    User First name:<input type="text" name="firstName"  id="firstName"><br>
    User Last name:<input type="text" name="lastName" id="lastName"><br>
    User Describing:<input type="text" name="describe" id="describe"><br>
    <button id="submitUser">Add User</button>

</form>

</body>
</html>