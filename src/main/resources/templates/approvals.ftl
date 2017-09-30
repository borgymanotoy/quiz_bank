<#import "masterTemplate.ftl" as t>

<!DOCTYPE html>
<html lang="en">

    <head>
        <@t.headerMetaTags />
        <title>Capstone: Student-Class Registrations for Approval</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/approvals.css">
    </head>

    <body>
        <!-- Navigation -->
        <@t.navigationDiv />

        <!-- Page Content -->
        <div id="divMain" class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h4><i class="fa fa-users" aria-hidden="true"></i>&nbsp;Student Registration to Class for Approval</h4>
                    <br />
                    <table id="tblEnrollmentForApproval" class="table table-hover">
                        <thead>
                        <tr>
                            <th>Class</th>
                            <th>Student</th>
                            <th>Accept</th>
                            <th>Deny</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if forApproval??>
                            <#list forApproval as apv>
                                <tr>
                                    <td>${apv["className"]} (${apv["class"]})</td>
                                    <td>${apv["studentName"]}</td>
                                    <td><a href='javascript:void(0);' onclick="approveStudentClassEnrollment('${apv["student"]}','${apv["class"]}')" class="btn btn-primary" role="button">Approve</a></td>
                                    <td><a href='javascript:void(0);' onclick="denyStudentClassEnrollment('${apv["student"]}','${apv["class"]}')" class="btn btn-primary" role="button">Deny</a></td>
                                </tr>
                            </#list>
                        <#else>
                        <td colspan="4">No Data Available</td>
                        </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <@t.bootstrapCoreJS />
        <script src="js/approvals.js"></script>
    </body>

</html>