<#import "masterTemplate.ftl" as t>

<!doctype HTML>
<html>
    <head>
        <@t.headerMetaTags />
        <title>Capstone: Register a Class (Course)</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/course-template.css" rel="stylesheet">
    </head>
    <body>
        <@t.navigationDiv />

        <div class="container">
            <div class="row sm-flex-center top-space">
                <div class="col-sm-4 column-separator">
                    <div class="panel panel-info">
                        <h4><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Course Details</h4>
                        <div class="panel-body" >
                            <div class="form-group has-error has-feedback">
                                <label class="control-label"><b>Class Code:</b><span class="details">${classCode!""}</span></label>
                            </div>

                            <div class="form-group">
                                <label class="control-label"><b>Class Name:</b><span class="details">${className!""}</span></label>
                            </div>

                            <div class="form-group">
                                <label class="control-label"><b>Class Description:</b><p class="details">${classDescription!""}</p></label>
                            </div>

                            <div class="form-group">
                                <div>
                                    <button class="btn btn-info" data-toggle="modal" data-target="#myModal"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;Course Details</button>
                                    <button class="btn btn-info" onclick="window.location='/newVideo'"><i class="fa fa-youtube" aria-hidden="true"></i>&nbsp;Add Video</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8 pull-right">
                    <h4><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;Student Registration to Class for Approval</h4>
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

            <hr />

            <div class="row top-space">
                <div class="col-sm-12">
                    <h4><i class="fa fa-th-list" aria-hidden="true"></i>&nbsp;Class List</h4>
                    <table id="tblClassList" class="table table-hover">
                        <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email Address</th>
                            <th>Score</th>
                            <th>Average</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if classList??>
                            <#list classList as student>
                            <tr>
                                <td>${student["firstName"]}</td>
                                <td>${student["lastName"]}</td>
                                <td>${student["email"]!"n/a"}</td>
                                <td>${student["totalScore"]?string["0.##"]}</td>
                                <td>${student["totalAverage"]?string["0.##"]}</td>
                            </tr>
                            </#list>
                        <#else>
                            <td colspan="4">No Data Available</td>
                        </#if>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-12">
                    <div class="col-md-offset-6 col-md-6">
                        <button id="btnClassList" class="btn btn-info" onclick="window.location='/classList?c=${classCode!""}'"><i class="fa fa-list" aria-hidden="true"></i>&nbsp;Class List</button>
                        <button id="btnClassList" class="btn btn-primary" onclick="window.location='/studentSearchPage?c=${classCode!""}'"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search & Add Student to Class</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal for Add Question -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;Course Details</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group has-error has-feedback">
                            <label for="txtClassCode" class="control-label">Class Code</label>
                            <div>
                                <input type="text" id="txtClassCode" class="form-control" name="classCode" value="${classCode!""}" placeholder="Class or Course Code" title="Enter Class or Course Code" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtClassName" class="control-label">Class Name</label>
                            <div>
                                <input type="text" class="form-control" id="txtClassName" name="className" value="${className!""}" placeholder="Class or Course Name" title="Enter Class or Course Name" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtClassDescription" class="control-label">Class Description</label>
                            <div>
                                <textarea class="form-control" id="txtClassDescription" name="classDescription" placeholder="Class or Course Description" title="Enter Class or Course Description" cols="30" rows="3" style="width: 91.5%">${classDescription!""}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" data-dismiss="modal" onclick="updateCourseDetails()">Save</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- End: Modal For Add Question -->

        <@t.bootstrapCoreJS />
        <script src="js/course.js"></script>
    </body>
</html>

