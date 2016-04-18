class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_train, :set_stations, only: [:new, :create]

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = @user

    if @ticket.save
      redirect_to user_tickets_path(@user, @ticket), notice: 'Билет успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Билет успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to user_tickets_path(@user), notice: 'Билет успешно удален.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    #@user = params.try(:user_id) ? User.find(params.try(:user_id)) : User.first
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