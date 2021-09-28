class AlertsController < ApplicationController
  before_action :set_alert, only: %i[ show edit update destroy ]
  before_action :set_select, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, only: [ :index, :show, :new, :edit, :update, :destroy ]


  # GET /alerts or /alerts.json
  def index
    @alerts = Alert.all


    
  end

  # GET /alerts/1 or /alerts/1.json
  def show
    
  end

  # GET /alerts/new
  def new

    @alert = Alert.new
    
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts or /alerts.json
  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user

    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: "Alerta creada exitosamente" }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1 or /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: "Alerta modificada exitosamente" }
        format.json { render :show, status: :ok, location: @alert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1 or /alerts/1.json
  def destroy
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url, alert: "La alerta ha sido eliminada" }
      format.json { head :no_content }
    end
  end

  # setear select de ciudades y clases
  def set_select

    @class_services = ClassService.all


    @list_cities=[]
    response_cities = Typhoeus.get('https://demo.recorrido.cl/api/v2/es/cities.json?country=chile', userpwd: 'recorrido:recorrido') 

  
    @cities = JSON.parse(response_cities.body)

  

    @cities['cities'].each do |item|  
      if item['country_id'] == 1 
          @list_cities.push([item['id'], item['name']])
      end 
    end 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
      class_services = ClassService.all
      @clase = class_services.find(@alert.class_alert)
    end

    # Only allow a list of trusted parameters through.
    def alert_params
      params.require(:alert).permit(:name_alert, :from_alert, :to_alert, :class_alert, :price_alert)
    end

    
end
