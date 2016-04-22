class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
    if params[:arrival_station] && params[:departure_station]
      @arrival_station = RailwayStation.find(params[:arrival_station])
      @departure_station = RailwayStation.find(params[:departure_station])
      @routes = @arrival_station.routes & @departure_station.routes
    end
  end
end