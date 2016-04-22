/**
 * Created by rustam on 22.04.16.
 */
$(document).ready(function() {
    $('.search_form').submit(function(){
        var arrival_station;
        var departure_station;
        arrival_station = $(this).find("#arrival_station");
        departure_station = $(this).find("#departure_station");

        console.log(arrival_station);

        if (arrival_station.val() == departure_station.val()) {
            alert('Выберите конечную станцию!');
            return false;
        }
    });
});
