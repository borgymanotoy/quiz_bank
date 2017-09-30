<#import "masterTemplate.ftl" as t>

<!DOCTYPE html>
<html lang="en">

    <head>
        <@t.headerMetaTags />
        <title>Capstone: Class Search</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
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

                    <h1 class="mt-5"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;Search Class(es)</h1>

                    <form id="formClassSearch" action="searchClass" method="get">
                        <div class="input-group">
                            <input type="text" id="txtSearchKey" name="searchKey" class="form-control" placeholder="Search Course Name" title="Enter key to search">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                            </div>
                        </div>
                    </form>

                    <br />
                    <hr />
                    <br />

                    <table id="tblClassSearch" class="table table-hover">
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Instructor</th>
                                <th>Enroll</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">No Data Available</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <@t.bootstrapCoreJS />
        <script src="js/search-class.js"></script>
    </body>
</html>