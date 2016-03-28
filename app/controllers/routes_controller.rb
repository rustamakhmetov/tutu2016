class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :add_stations, :update_stations, :delete_station]

  add_flash_types :error

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to @route, notice: 'Маршрут успешно создан.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Маршрут успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Маршрут успешно удален.'
  end

  def add_stations
    @railway_stations = RailwayStation.all.where.not(id: @route.stations)
  end

  def update_stations
    stations = route_params[:stations].reject(&:blank?)
    if !stations.empty?
      @route.stations << RailwayStation.where(id: stations)
      redirect_to route_url, notice: 'Маршрут успешно удален.'
    else
      redirect_to stations_route_url, error: 'Обязательно выберите хотя бы одну станцию!'
    end
  end

  def delete_station
    station = RailwayStation.find(params[:station_id])
    @route.delete_station(station)
    redirect_to route_url, notice: 'Станция "%s" успешно удалена.' % station.title
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, station_ids: [])
  end

end