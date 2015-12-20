$(document).ready(function() {
    $('#button').click(function() {
        var videoid = $('#video_url').val();
        var matches = videoid.match(/^http:\/\/www\.youtube\.com\/.*[?&]v=([^&]+)/i) || videoid.match(/^https:\/\/www\.youtube\.com\/.*[?&]v=([^&]+)/i) || videoid.match(/^http:\/\/youtu\.be\/([^?]+)/i);
        if (matches) {
            videoid = matches[1];
        }
        if (videoid.match(/^[a-z0-9_-]{11}$/i) === null) {
            $("<p style='color: #F00;'>Unable to parse Video ID/URL.</p>").appendTo("#video-data-1");
            return;
        }
        $.getJSON("https://www.googleapis.com/youtube/v3/videos", {
            key: "AIzaSyB010sQoziXoiguC5YvRfi9mkyHp_lPtAk",
            part: "snippet,statistics",
            id: videoid
        }, function(data) {
            if (data.items.length === 0) {
                $("<p style='color: #F00;'>Video not found.</p>").appendTo("#video-data-1");
                return;
            }
            $("<img>", {
                src: data.items[0].snippet.thumbnails.medium.url,
                width: data.items[0].snippet.thumbnails.medium.width,
                height: data.items[0].snippet.thumbnails.medium.height
            }).appendTo(".image-video");
            $('#video_url').val(videoid);
            $('#video_title').val(data.items[0].snippet.title);
            $('#video_description').val(data.items[0].snippet.description);
        }).fail(function(jqXHR, textStatus, errorThrown) {
            $("<p style='color: #F00;'></p>").text(jqXHR.responseText || errorThrown).appendTo("#video-data-1");
        });
    });
});