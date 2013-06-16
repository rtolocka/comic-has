$(document).ajaxComplete(function(e, request, opts) { 
    msg = request.getResponseHeader('X-Message');
    $(".errors").hide();
    $(".errors").html(request.getResponseHeader('X-Message'));
    $(".errors").slideDown();
});