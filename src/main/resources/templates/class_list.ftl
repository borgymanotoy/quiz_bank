<#import "masterTemplate.ftl" as t>

<!doctype HTML>
<html>
    <head>
    <@t.headerMetaTags />
        <title>Capstone: Register a Class (Course)</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/class-list.css" rel="stylesheet">
    </head>
    <body>
        <@t.navigationDiv />

        <div class="container">
            <div class="row top-space">
                <div class="col-sm-12">
                    <h4><i class="fa fa-list" aria-hidden="true"></i>&nbsp;${className!'Course'} class list</h4>
                    <table id="tblClassList" class="table table-hover">
                        <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email Address</th>
                            <th>Score</th>
                            <th>Average</th>
                            <th>Drop</th>
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
                                <td>${student["totalAverage"]?string["0.##"]}%</td>
                                <td><a href="javascript:void(0);" onclick="dropStudent('${classCode}','${student["_id"]}')" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
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
        <script src="js/class-list.js"></script>
    </body>
</html>