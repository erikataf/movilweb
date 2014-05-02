class AlertsController < ApplicationController
  # GET /alerts
  # GET /alerts.json
  def index
    if current_user.email=="terika@uninorte.edu.co" || current_user.email=="elsoto@uninorte.edu.co"
      @alerts =Alert.all
    else
      @alerts = Alert.find_all_by_user_id(current_user.id)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @alerts }
      end
    end
  end  
  # GET /alerts/1
  # GET /alerts/1.json
  def show
    @alert = Alert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alert }
    end
  end

  # GET /alerts/new
  # GET /alerts/new.json
  def new
    if current_user.email=="terika@uninorte.edu.co" || current_user.email=="elsoto@uninorte.edu.co"
      @alert = Alert.new
      @barrios=Barrio.order('barrio').map {|barrio| [barrio.barrio, barrio.id]}
      @users=User.all.map {|user| [user.name, user.id]}
      respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @alert }
        end
    else  
    @alert = Alert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alert }
    end
  end
  end

  # GET /alerts/1/edit
  def edit
    @alert = Alert.find(params[:id])
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(params[:alert])

    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: 'Alert was successfully created.' }
        format.json { render json: @alert, status: :created, location: @alert }
      else
        format.html { render action: "new" }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alerts/1
  # PUT /alerts/1.json
  def update
    @alert = Alert.find(params[:id])

    respond_to do |format|
      if @alert.update_attributes(params[:alert])
        format.html { redirect_to @alert, notice: 'Alert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to alerts_url }
      format.json { head :no_content }
    end
  end
end
