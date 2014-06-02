class PremonitionsController < ApplicationController

  before_action :set_premonition, only: [:show]
  # [:show, :edit, :update, :destroy]
  # GET /premonitions
  # GET /premonitions.json
  #def index
   # @premonitions = Premonition.all
  #end

  # GET /premonitions/1
  # GET /premonitions/1.json
  def show
  end

  # GET /premonitions/new
  def new
    @premonition = Premonition.new
  end

  # GET /premonitions/1/edit
  #def edit
  #end

  # POST /premonitions
  # POST /premonitions.json
  def create
    
    @premonition_params = premonition_params
    @premonition_params["status"] = 0 
    @premonition_params["date"] = Date.strptime(@premonition_params["date"], '%m/%d/%Y').strftime('%Y%m%d')
    @premonition_params["tags"] = @premonition_params["tags"].split(",")

    sesionUserActive = session[:user_id]

    if !sesionUserActive.nil?

      if !sesionUserActive["$oid"].nil?
        @premonition_params["user_id"] = sesionUserActive["$oid"].to_s
        @premonition_params["status"] = 1 
      else
      @premonition_params["status"] = 0
      end

    else
      @premonition_params["status"] = 0
    end

    @premonition = Premonition.new(@premonition_params)

    respond_to do |format|
      if @premonition.save
        format.html { redirect_to @premonition, notice: 'Premonition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @premonition }
      else
        format.html { render action: 'new' }
        format.json { render json: @premonition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premonitions/1
  # PATCH/PUT /premonitions/1.json
  #def update
    #respond_to do |format|
      #if @premonition.update(premonition_params)
        #format.html { redirect_to @premonition, notice: 'Premonition was successfully updated.' }
        #format.json { head :no_content }
      #else
        #format.html { render action: 'edit' }
        #format.json { render json: @premonition.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /premonitions/1
  # DELETE /premonitions/1.json
  #def destroy
    #@premonition.destroy
    #respond_to do |format|
      #format.html { redirect_to premonitions_url }
      #format.json { head :no_content }
    #end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premonition
      @premonition = Premonition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premonition_params
      params.require(:premonition).permit(:title, :date, :type, :type_description, :description, :location_user, :location_premonition, :premonition_come_true, :premonition_come_true_description, :someone_else, :own_conclusions, :more_premonitions, :tags, :status)
    end
end
