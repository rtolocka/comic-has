$(document).ready(function() 
    {
    $("#searchfield").typeahead({
        minLength: 1,
        source: function(query, process) {
            $.get('/titles/names', { q: query, limit: 8 }, function(data) {
                process(data);
            });
        }
    });
});