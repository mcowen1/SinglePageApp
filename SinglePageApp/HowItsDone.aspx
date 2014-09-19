<%@ Page Language="C#" Title="How Its Done" AutoEventWireup="true" CodeBehind="HowItsDone.aspx.cs" Inherits="SinglePageApp.HowItsDone" %>

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


                    <div>
                        <h1>The Multiview </h1>
                        <p class="lead">Explore the use of the Multiview to create Server Side Single Page Applications</p>
                    </div>
                    <div class='row'>
                        <h2>Follow these steps</h2>
                        <div>
                            <ul id="Steps" class='nav nav-wizard'>
                                <li id="nav1" class='active'><a href='#step1' data-toggle="tab">Step 1 - Add MultiView </a></li>
                                <li id="nav2"><a href='#step2' data-toggle="tab">Step 2 - Add Views</a></li>
                                <li id="nav3"><a href='#step3' data-toggle="tab">Step 3 - Add your Grid</a></li>
                                <li id="nav4"><a href='#step4' data-toggle="tab">Step 4 - Add Edit page </a></li>
                                <li id="nav5"><a href='#step5' data-toggle="tab">Step 5 - Switch between views</a></li>
                            </ul>
                            <br />
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade  active in  adbordereddiv" id="step1">
                                    <h3>Multiview</h3>
                                    <p>
                                        The key to a server side Single Page Application is the use of the Multiview.<br />
                                        Multiview, if you have never used it, comes as a standard control in the Visual Studio toolkit.
                                    </p>
                                    <img src="Images/MultiView.png" alt=" " /><br />
                                    <br />
                                    <p>Start by dragging this control onto your page.</p>

                                    <img src="Images/MultiviewDrag.png" />

                                    <p>Next (Step 2) add server side Views inside the Multiview</p>

                                </div>
                                <div class="tab-pane fade adbordereddiv" id="step2">
                                    <h3>Create views</h3>

                                    <p>
                                        As you will see, this is a very simple but effective control that allows you to make any <mark>one </mark>page simulate <mark>multiple</mark> pages. Each
                                        View element within the Multiview looks like a separate  page.<br />

                                        The illustration below provides 4 areas or views that will appear as separate  pages but you can switch between them without any postback
                                        so we have essentially created a single page application that operates with server side controls and uses no JavaScript.
                                    </p>

                                    <img src="Images/MultiView2.png" />
                                </div>
                                <div class="tab-pane fade adbordereddiv" id="step3">
                                    <h3>Step 3 Add View1 Content</h3>
                                    <p>
                                        In each view we can now add content.
                                <br />
                                        In the first view we place our asp Gridview Control and bind it to a data source.

                                    </p>
                                    <br />
                                    <img src="Images/GridSample.png" />

                                </div>
                                <div class="tab-pane fade adbordereddiv" id="step4">
                                    <h3>Step 4 Settings</h3>
                                    <p>
                                        In the second View we place our Add/Edit page. 
                                    </p>
                                    <img src="Images/Edit.png" />
                                </div>
                                <div class="tab-pane fade adbordereddiv" id="step5">
                                    <h3>Step 5 - Switch between views</h3>
                                    <p>
                                        Switching between views is extremely  easy.<br />
                                        In the code behind 
                                    </p>
                                    <pre><code>

        // Set starting view in the page Load 
        // In this case it will start in the first View ActiveViewIndex = 0
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        // Chnage views on any event - in this case the "Add" button
        // switches the view to View2 - Add/Edit Page
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;

        }
                                       </code> </pre>
                                    <br />
                                    <p>So there you have it. A very simple and fast method of achieving a <mark>Single Page</mark> and<mark> Responsive</mark> Application with verty little time and very little code.</p>


                                </div>
                            </div>
                            <br />
                            <br />
                            <button type="button" id="btnPrev" title="Move Next" class="btn btn-primary" disabled="disabled">< Previous</button>
                            <button type="button" id="btnNext" title="Move Next" class="btn btn-primary">Next ></button>
                            <button type="button" id="btnBack"  Title="Return to Grid" Class="btn btn-success" onclick="location.href = 'SinglePageSample.aspx';" >Return</button>
                        </div>
                    </div>

        </div>
        <script>
            $(function () {




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
