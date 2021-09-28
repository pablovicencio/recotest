class ClassServicesController < ApplicationController
  before_action :set_class_service, only: %i[ show edit update destroy ],
  before_action :authenticate_user!, only: [ :index, :show, :new, :edit, :update, :destroy ]

  # GET /class_services or /class_services.json
  def index
    @class_services = ClassService.all
  end

  # GET /class_services/1 or /class_services/1.json
  def show
  end

  # GET /class_services/new
  def new
    @class_service = ClassService.new
  end

  # GET /class_services/1/edit
  def edit
  end

  # POST /class_services or /class_services.json
  def create
    @class_service = ClassService.new(class_service_params)

    respond_to do |format|
      if @class_service.save
        format.html { redirect_to @class_service, notice: "Class service was successfully created." }
        format.json { render :show, status: :created, location: @class_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_services/1 or /class_services/1.json
  def update
    respond_to do |format|
      if @class_service.update(class_service_params)
        format.html { redirect_to @class_service, notice: "Class service was successfully updated." }
        format.json { render :show, status: :ok, location: @class_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_services/1 or /class_services/1.json
  def destroy
    @class_service.destroy
    respond_to do |format|
      format.html { redirect_to class_services_url, notice: "Class service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_service
      @class_service = ClassService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_service_params
      params.require(:class_service).permit(:title, :enable)
    end
end
