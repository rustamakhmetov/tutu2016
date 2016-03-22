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
      redirect_to @route, notice: 'Route was successfully created.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Route was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Route was successfully destroyed.'
  end

  def add_stations
    @railway_stations = RailwayStation.all.where.not(id: @route.stations)
  end

  def update_stations
    stations = params[:stations][:id].reject(&:blank?)
    if !stations.empty?
      @route.stations << RailwayStation.where(id: stations)
      redirect_to route_url, notice: 'Railway stations was successfully added.'
    else
      redirect_to stations_route_url, error: 'First select the railway stations!'
    end
  end

  def delete_station
    station = RailwayStation.find(params[:station_id])
    @route.stations.delete(station)
    redirect_to route_url, notice: 'Railway station "%s" was successfully removed.' % station.title
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name)
  end

end