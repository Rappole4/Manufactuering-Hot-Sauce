class SaucesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_sauce, only: [:show, :edit, :update, :destroy]
  before_action :owned_sauce, only: [:edit, :delete, :update]


  # GET /sauces
  # GET /sauces.json
  def index
    @sauces = Sauce.all
  end

  # GET /sauces/1
  # GET /sauces/1.json
  def show
  end

  # GET /sauces/new
  def new
    @sauce = Sauce.new
    @locations = Location.all
  end

  # GET /sauces/1/edit
  def edit
  end

  # POST /sauces
  # POST /sauces.json
  def create
    @sauce = Sauce.new(sauce_params)
    @locations = Location.all

    respond_to do |format|
      if @sauce.save
        format.html { redirect_to @sauce, notice: 'Sauce was successfully created.' }
        format.json { render :show, status: :created, location: @sauce }
      else
        format.html { render :new }
        format.json { render json: @sauce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sauces/1
  # PATCH/PUT /sauces/1.json
  def update
    respond_to do |format|
      if @sauce.update(sauce_params)
        format.html { redirect_to @sauce, notice: 'Sauce was successfully updated.' }
        format.json { render :show, status: :ok, location: @sauce }
      else
        format.html { render :edit }
        format.json { render json: @sauce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sauces/1
  # DELETE /sauces/1.json
  def destroy
    @sauce.destroy
    respond_to do |format|
      format.html { redirect_to sauces_url, notice: 'Sauce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sauce
      @sauce = Sauce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sauce_params
      params.require(:sauce).permit(:name, :description, :origin_id, :ingredients,:image)
    end

    def owned_sauce
      unless current_user == @sauce.user
        flash[:alert] = "This is not your post!"
        redirect_to root_path
      end
    end

end
