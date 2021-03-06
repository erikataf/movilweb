class EventsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :create, :index, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    if current_user.email=="terika@uninorte.edu.co" || current_user.email=="elsoto@uninorte.edu.co"
     @events=Event.all 
    else  
      @events = Event.order('created_at').reverse_order.find_all_by_user_id(current_user.id)
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
      end
    end
  end  
  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    if current_user.email=="terika@uninorte.edu.co" || current_user.email=="elsoto@uninorte.edu.co"
      @event = Event.new
      @barrios=Barrio.order('barrio').map {|barrio| [barrio.barrio, barrio.id]}
      @users=User.all.map {|user| [user.name, user.id]}
      respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @event }
        end
    else  
        @event = Event.new

        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @event }
        end
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
end
