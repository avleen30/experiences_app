class EventsUsersController < ApplicationController
  before_action :set_events_user, only: [:show, :edit, :update, :destroy]

  # GET /events_users
  # GET /events_users.json
  def index
    @events_users = EventsUser.where(user_id: params[:id])
    # @events_user = EventsUser.where(user_id: params[:id])
  end

  # GET /events_users/1
  # GET /events_users/1.json
  def show
    # @events_user = EventsUser.new
  end

  # GET /events_users/new
  def new
    @events_user = EventsUser.new
  end

  # GET /events_users/1/edit
  def edit
  end

  # POST /events_users
  # POST /events_users.json
  def create
    status = params[:interested] ? 'Interested' : 'Going'
    event = Event.find(params[:event_id])
    @events_user = EventsUser.new(
      user_id: current_user.id,
      event_id: event.id,
      status: status
    )

    respond_to do |format|
      if @events_user.save
        format.html { redirect_to event, notice: 'Events user was successfully created.' }
        format.json { render :show, status: :created, location: @events_user }
      else
        format.html { render :new }
        format.json { render json: @events_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events_users/1
  # PATCH/PUT /events_users/1.json
  def update
    respond_to do |format|
      if @events_user.update(events_user_params)
        format.html { redirect_to @events_user, notice: 'Events user was successfully updated.' }
        format.json { render :show, status: :ok, location: @events_user }
      else
        format.html { render :edit }
        format.json { render json: @events_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events_users/1
  # DELETE /events_users/1.json
  def destroy
    @events_user.destroy
    respond_to do |format|
      format.html { redirect_to events_users_url, notice: 'Events user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_events_user
      @events_user = EventsUser.where(user_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def events_user_params
      params.require(:events_user).permit(:status, :rating)
    end
end
