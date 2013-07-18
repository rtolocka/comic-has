$(document).ready(function() 
    {
        $("#want-button").click(function() {
            $("#want-button").addClass("btn-success");    
            $("#have-button").removeClass("btn-success");    
        });
        $("#have-button").click(function() {
            $("#have-button").addClass("btn-success");
            $("#want-button").removeClass("btn-success");
        });
    });