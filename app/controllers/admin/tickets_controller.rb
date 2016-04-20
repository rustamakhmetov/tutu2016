class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_train, :set_stations, only: [:update]

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/1/edit
  def edit
    @stations = RailwayStation.all
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: t('.notice')
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path(@ticket), notice: t('.notice')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(ticket_params[:train_id])
  end

  def set_stations
    @start_station = RailwayStation.find(ticket_params[:start_station_id])
    @end_station = RailwayStation.find(ticket_params[:end_station_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id, :start_station_id, :end_station_id, :fio, :passport)
  end

end