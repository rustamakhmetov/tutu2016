class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_parameters]
  before_action :set_route, only: :update_parameters

  # GET /railway_stations
  # GET /railway_stations.json
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  # GET /railway_stations/1.json
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  # POST /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station], notice: t('.notice')
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  # PATCH/PUT /railway_stations/1.json
  def update
    if @railway_station.update(railway_station_params)
      redirect_to [:admin, @railway_station], notice: t('.notice')
    else
      render :edit
    end
  end

  # DELETE /railway_stations/1
  # DELETE /railway_stations/1.json
  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_url, notice: t('.notice')
  end

  def update_parameters
    update_position
    update_times
    redirect_to [:admin, @route]
  end

  private

    def update_position
      @railway_station.update_position(@route, params[:position])
    end

    def update_times
      @railway_station.update_times(@route, params[:arrival_time], params[:departure_time])
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end

    def set_route
      @route ||= Route.find(params[:route_id])
    end
end
