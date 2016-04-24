$(document).ready(function(){
     var cancel = function (self) {
        var train_id = self.data('trainId');
        var form = $("#edit_train_" + train_id);
        var title = $("#train_title_" + train_id);
        form.toggle();
        title.toggle();
    };
    $("div.train_title").click(function(e){
        e.preventDefault();
        cancel($(this));
    });
    $("button.btn_train_cancel").click(function(e){
        e.preventDefault();
        cancel($(this));
    });
});
