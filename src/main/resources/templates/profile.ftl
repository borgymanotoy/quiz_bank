<#import "masterTemplate.ftl" as t>

<!DOCTYPE html>
<html>
<head>
<@t.headerMetaTags />
    <title>Capstone: Sign Up</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/profile.css" rel="stylesheet">
</head>

<body>
<@t.navigationDiv />

<div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
    <h4><i class="fa fa-user" aria-hidden="true"></i>&nbsp;User Profile</h4>
    <hr>
    <div class="panel panel-info">
        <div class="panel-body" >

            <div class="form-group">
                <label for="username" class="col-md-6 control-label"><i class="fa fa-id-badge" aria-hidden="true"></i>&nbsp;<b>Username:</b>&nbsp;<span>${username!"N/A"}</span></label>
            </div>

            <div class="form-group">
                <label for="username" class="col-md-6 control-label"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;<b>Type:</b>&nbsp;<span>${type!"N/A"}</span></label>
            </div>

            <form id="profileform" class="form-horizontal" role="form" action="/profile" method="post">

                <#if update_success??>
                    <div id="updateProfileAlert" style="display:none" class="alert alert-info">
                        <p>Error: <span>${update_success}</span></p>
                    </div>
                </#if>
                <#if update_error??>
                    <div id="updateProfileAlert" style="display:none" class="alert alert-danger">
                        <p>Error: <span>${update_error}</span></p>
                    </div>
                </#if>

                <div class="form-group has-error has-feedback">
                    <label for="txtFirstName" class="col-md-3 control-label">First Name</label>
                    <div class="col-md-9">
                        <input type="text" id="txtFirstName" class="form-control" name="firstName" placeholder="First Name" value='${firstName!""}' />
                    </div>
                </div>

                <div class="form-group has-error has-feedback">
                    <label for="txtLastName" class="col-md-3 control-label">Last Name</label>
                    <div class="col-md-9">
                        <input type="text" id="txtLastName" class="form-control" name="lastName" placeholder="Last Name" value='${lastName!""}' />
                    </div>
                </div>

                <#--
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="verify" class="col-md-3 control-label">Verify Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="verify" placeholder="Verify Password">
                        </div>
                    </div>
                -->

                <div class="form-group">
                    <label for="email" class="col-md-3 control-label">Email (Optional)</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="email" placeholder="Email Address (Optional)" value='${email!""}'>
                    </div>
                </div>

                <div class="checkbox">
                    <#if isActive?? && isActive>
                        <label><input type="checkbox" id="chkIsActive" name="isActive" value="active" checked>&nbsp;<b>Active</b></label>
                    <#else>
                        <label><input type="checkbox" id="chkIsActive" name="isActive" value="active">&nbsp;<b>Active</b></label>
                    </#if>
                </div>

                <hr>

                <div class="form-group">
                    <!-- Button -->
                    <div class="col-md-offset-3 col-md-9">
                        <input type="submit" id="btn-signup" class="btn btn-primary" value="&nbsp Update Profile" />
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<@t.bootstrapCoreJS />
</body>
</html>
