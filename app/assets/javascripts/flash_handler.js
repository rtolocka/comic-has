$(document).ajaxComplete(function(e, request, opts) { 
    msg = request.getResponseHeader('X-Message');
    $(".errors").hide();
    $(".errors").html(request.getResponseHeader('X-Message-Error'));
    $(".errors").slideDown();
    $(".notices").hide();
    $(".notices").html(request.getResponseHeader('X-Message-Notice'));
    $(".notices").slideDown();    
});