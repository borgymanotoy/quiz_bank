<#import "masterTemplate.ftl" as t>

<!DOCTYPE html>
<html lang="en">

<head>
<@t.headerMetaTags />
    <title>Capstone: Student Search</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/search.css" rel="stylesheet">
</head>

<body>
<@t.navigationDiv />

<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-12 text-left">
            <br />

            <div id="status-alert" class="alert alert-success" style="display:none;">
                <p style="margin-bottom: 0px;"><span id="spnStatus"></span></p>
            </div>

            <h1 class="mt-5"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search Student(s)</h1>

            <form id="formStudentSearch" action="studentSearch" method="get">
                <input type="hidden" id="hndCourse" name="course" value="${classCode!''}" />
                <div class="input-group">
                    <input type="text" id="txtSearchKey" name="searchKey" class="form-control" placeholder="Search student name" title="Enter key to search">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </div>
                </div>
            </form>

            <br />
            <hr />
            <br />

            <table id="tblStudentList" class="table table-hover">
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Address</th>
                    <th>Register</th>
                </tr>
                </thead>
                <tbody>
                    <td colspan="4">No Data Available</td>
                </tbody>
            </table>
        </div>
    </div>
</div>

<@t.bootstrapCoreJS />
<script src="js/search-student.js"></script>
</body>
</html>