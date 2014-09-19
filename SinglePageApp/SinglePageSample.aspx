<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SinglePageSample.aspx.cs" Inherits="SinglePageApp.SinglePageSample" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Single Page Application  Sample</title>
    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <link href="Content/bootstrap-nav-wizard.css" rel="stylesheet" />
    <link href="Content/SiteStyles.css" rel="stylesheet" />
    <link href="Content/doxy.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Always">
                <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="mainView" runat="server">

                    <div class="well">

                        <div class="media media-heading">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="Images/clock.png" alt="Clock">
                            </a>
                            <div>
                                <h2>Multiview and Bootstrap Creates</h2>
                                <h2>Responsive, Single Page Applications with no JavaScript</h2>
                            </div>
                            <div class="alert alert-success">
                                <h4>If you are like me, coding quickly and cheaply means the difference between working and not working, </h4>
                              
                                <h4>so Rapid Application Development is not a choice but an imperative in today's contract work environment.</h4>
                                <p>
                                    Customers, at the same time, expect that their applications will look and feel modern and appealing. Today this requires that your applications use 
                                            <a id="rd" data-toggle="popover" title="Responsive Page"
                                                data-content="Responsive web design term is related to the concept of developing a website design in a manner 
                                                that helps the lay out to get changed according to the user’s computer screen resolution">responsive design </a>and are
                                            
                                              <a id="sp" data-toggle="popover" title="Single Page Application"
                                                  data-content="In a SPA, either all necessary code is retrieved with a single page load,or the appropriate resources are dynamically
                                                   loaded and added to the page as necessary, usually in response to user actions. The page does not reload at any point in the process, nor does control transfer to another page.">Single Page Applications.</a>
                                    With is in mind I have developed many ways to make High Quality Good looking code quickly.
                                </p>
                                <h3>This simple example illustrates the use of the server side ASP Multiview Control and Bootstrap to accomplish our task.</h3>
                                <br />
                                <br />
                                <button type="button" id="btnHow"  Title="Return to Grid" Class="btn btn-success" onclick="location.href = 'HowItsDone.aspx';" >See how it's done</button>
                                <br />
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        NOTE: If you try out this Grid I have made no attempt, in this code, to persist edits. The point of this exercise is merely to explore the use of the Multiview server side control.
                                           The Grid is populated from a simple List. Normally, of course, in production code the grid would be populated from a database data source.
                    </div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" class="table table-striped table-bordered table-responsive" EnablePersistedSelection="True"
                        MaintainScrollPositionOnPostback="true" DataKeyNames="Name" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="DoEvents" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="DeptID" HeaderText="Dept ID">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Dept Name" />
                            <asp:BoundField DataField="eMail" HeaderText="Email" />
                            <asp:BoundField DataField="IsActive" HeaderText="Active Status">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Edit Record">
                                <ItemTemplate>
                                    <asp:Button ID="editIt" runat="server" CommandArgument='<%# Bind("ID") %>' Text="Edit" ToolTip="Edit selected record" CssClass="btn btn-primary btn-sm" CommandName="EditIt" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete Record">
                                <ItemTemplate>
                                    <asp:Button ID="ToggleIt" runat="server" CommandArgument='<%# Bind("ID") %>' Text="In Active" ToolTip="Make selected Employee Inactive" CssClass="btn btn-sm" CommandName="DeleteIt" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#FF5050" />
                    </asp:GridView>

                    <asp:Button ID="btnAdd" runat="server" Text="Add new Employee Server Method" class="btn btn-primary" OnClick="btnAdd_Click" />

                </asp:View>
                <asp:View runat="server" ID="editView">

                    <div class="modal-dialog small ">
                        <div class="modal-content">
                            <asp:HiddenField ID="HiddenID" runat="server" Value="null" />
                            <div class="modal-header">
                                <asp:Label runat="server" class="h4 modal-title" ID="lblTitle" Text="Edit Employee Record" />
                                <asp:Label runat="server" class="h4 modal-title" ID="lblActive" Text="Active" />
                            </div>
                            <div class="modal-body col-sm-offset-2">
                                <div class="form-group  form-horizontal">
                                    <label for="exampleInputLastName">First Name</label>
                                    <asp:TextBox class="form-control" type="text" ID="txtFirstName" runat="server" ValidateRequestMode="Enabled" placeholder="Enter First name" required="required" OnTextChanged="txtFirstName_TextChanged"></asp:TextBox>

                                </div>
                                <div class="form-group  form-horizontal">
                                    <label for="exampleInputFirstName">Last Name</label>
                                    <asp:TextBox class="form-control" ID="txtLastName" type="text" runat="server" ValidateRequestMode="Enabled" placeholder="Enter Last name" required="required"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail">Email Address</label>
                                    <asp:TextBox class="form-control" type="email" ID="txtEmail" runat="server" ValidateRequestMode="Enabled" placeholder="Enter Valid Email" required="required"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <label for="department">Select Department</label>

                                    <asp:DropDownList ID="DepartmentDropDownList" runat="server" DataTextField="DepartmentName" DataValueField="DeptID" class="form-control" required="required">
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" CssClass="btn" UseSubmitBehavior="false" />
                                <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" CssClass="btn" />
                            </div>
                        </div>

                    </div>

                </asp:View>
                </asp:MultiView>
                </ContentTemplate>
                </asp:UpdatePanel>
           
        </div>
        <script>
            $(function () {


                $("#rd").click(function (evt) {

                    evt.preventDefault();
                }).popover({
                    placement: 'top'
                });

                $("#sp").click(function (evt) {

                    evt.preventDefault();
                }).popover({
                    placement: 'top'
                });


                var n = $('ul#Steps li').length;
                $('ul#Steps li').click(function () {
                    var x = $('ul#Steps li').index(this);
                    if (x == (n - 1)) {
                        $('#btnNext').attr('disabled', 'disabled');

                    }
                    else {
                        $('#btnNext').removeAttr('disabled');

                    }
                    if (x == 0) {
                        $('#btnPrev').attr('disabled', 'disabled');

                    }
                    else {

                        $('#btnPrev').removeAttr('disabled');
                    }

                });


                $('#btnNext').click(function () {
                    var n = $("li").length;
                    $("li.active").next().addClass("active");
                    $(".tab-pane.active").next().addClass("active in");
                    $("li.active").prev().removeClass("active");
                    $(".tab-pane.active").prev().removeClass("active in");
                    if ($('#Steps').children('li').last().hasClass('active')) {
                        $('#btnNext').attr('disabled', 'disabled');
                    }
                    $('#btnPrev').removeAttr('disabled');

                });

                $('#btnPrev').click(function () {
                    $("li.active").prev().addClass("active");
                    $(".tab-pane.active").prev().addClass("active in");
                    $("li.active").next().removeClass("active");
                    $(".tab-pane.active").next().removeClass("active in");
                    if ($("#nav1").hasClass("active")) {
                        $('#btnPrev').attr('disabled', 'disabled');
                    }
                    $('#btnNext').removeAttr('disabled');

                });
            });

        </script>

    </form>
</body>
</html>
