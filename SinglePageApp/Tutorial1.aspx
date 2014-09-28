<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tutorial1.aspx.cs" Inherits="JSONTutorial._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>

        $(function () {
            $.ajax({
                url: 'Employees2.json',
                datatype: 'json',
                type: 'get',
                cache: false,
                success: function (data) {
                    $(data.people).each(function (index, value) {
                        $('table#namesList').append('<tr><td>' + value.ID + '</td><td>' + value.FirstName + '</td><td>' + value.LastName  + '</td><td>' + value.Name + '</td><td>' + value.eMail + '</td><td>' + '<button type="button" name="editButton" id="EditButton" class="btn btn-primary myButton">Primary</button>' + '</td></tr>');
                    });
                },
                error: function (xhr,err) {
                   
                    alert(xhr.status);
                }

            });

            $('.myButton').click(function (data) {
                var user = $this.data.user;
            });
        });


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <div class="well">This is a Table</div>
            <table id="namesList" class="table table-bordered table-striped">
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Department Name</th>
                    <th>Email</th>
                    <th>Edit</th>
                </tr>


            </table>
        </div>
    </form>
</body>
</html>
