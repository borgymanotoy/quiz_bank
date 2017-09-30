<#import "masterTemplate.ftl" as t>

<!doctype HTML>
<html>
<head>
<@t.headerMetaTags />

    <title>Capstone: Add a video topic</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/videos.css">
</head>
<body>
<@t.navigationDiv />

<div class="container">
    <div class="row">
        <div class="panel panel-info" style="margin-top: 100px;">
            <h4><i class="fa fa-youtube" aria-hidden="true"></i>&nbsp;Video</h4>
            <hr />
            <div class="panel-body">
                <div class="form-group has-error has-feedback">
                    <label for="selClass" class="col-md-3 control-label">Class</label>
                    <div class="col-md-11">
                        <select name="sel_class" id="selClass" class="form-control">
                        <#if userClasses??>
                            <ul class="list-group">
                                <option class="list-group-item" value="">Select a Class</option>
                                <#list userClasses as cls>
                                    <option class="list-group-item" value="${cls["_id"]}">${cls["className"]}</option>
                                </#list>
                            </ul>
                        <#else>
                            <option value="N_A">No Class Available</option>
                        </#if>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtTitle" class="col-md-3 control-label">Topic</label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="txtTopic" name="subject" size="120" value=""><br />
                    </div>
                </div>

                <div id="divVplayer" class="form-group">
                    <iframe></iframe>
                </div>

                <div class="form-group right-inner-addon">
                    <div class="col-md-11">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <input type="search" class="form-control" id="txtVideoUrl" name="videolink" placeholder="https://www.youtube.com/watch?v=<YoutubeVideoId>" title="Enter valid youtube video link and press ENTER key to refresh the video." value="https://www.youtube.com/watch?v=__y8vWaVGqk" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row top-space">
        <div class="form-group">
            <div class="col-md-offset-3 col-md-11">
                <button type="button" class="btn btn-primary btn-md" onclick="postVideo()"><i class="fa fa-youtube" aria-hidden="true"></i>&nbsp;&nbsp;Add Video</button>
            </div>
        </div>
    </div>
</div>

<@t.bootstrapCoreJS />
<script src="js/videos.js"></script>

</body>
</html>

