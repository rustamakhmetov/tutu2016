$(document).ready(function() {
    $('a.edit_station').click(function(e){
        e.preventDefault();
        var station_id = $(this).data('stationId');
        var title = $("#railway_station_title_"+station_id);
        var form = $("#edit_railway_station_" + station_id);

        if ($(this).hasClass('cancel')) {
            $(this).html('Изменить');
            $(this).removeClass('cancel');
        } else {
            $(this).html('Отменить');
            $(this).addClass('cancel');
        }
        title.toggle();
        form.toggle();
    });
});