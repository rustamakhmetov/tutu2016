/**
 * Created by rustam on 22.04.16.
 */
$(document).ready(function(){
    var wagon_type = $("select.wagon_type");
    wagon_type.change(function(e){
        show_fields(this.value);
    });
    show_fields($("select.wagon_type option:selected").val());
});

function show_fields(wagon_type){
    $("#top_places").toggle(['CompartmentWagon', 'ReservedSeatWagon'].indexOf(wagon_type)!=-1);
    $("#bottom_places").toggle(['CompartmentWagon', 'ReservedSeatWagon', 'SleepingWagon'].indexOf(wagon_type)!=-1);

    var isReservedSeatWagon = ['ReservedSeatWagon'].indexOf(wagon_type)!=-1;
    $("#side_bottom_places").toggle(isReservedSeatWagon);
    $("#side_top_places").toggle(isReservedSeatWagon);

    $("#sedentary_places").toggle(['SedentaryWagon'].indexOf(wagon_type)!=-1);
}