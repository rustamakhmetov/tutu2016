$(document).ready(function(){
     var cancel = function (self) {
        var route_id = self.data('routeId');
        var form = $("#edit_route_" + route_id);
        var title = $("#route_title_" + route_id);
        form.toggle();
        title.toggle();
    };
    $("div.route_title").click(function(e){
        e.preventDefault();
        cancel($(this));
    });
    $("button.btn_route_cancel").click(function(e){
        e.preventDefault();
        cancel($(this));
    });
});
