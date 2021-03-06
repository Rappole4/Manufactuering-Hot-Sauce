class FactoriesController < ApplicationController
  before_action :set_factory, only: [:show, :edit, :update, :destroy]

  # GET /factories
  # GET /factories.json
  def index
    @factories = Factory.all
  end

  # GET /factories/1
  # GET /factories/1.json
  def show
  end

  # GET /factories/new
  def new
    @factory = Factory.new
    @sauces = Sauce.all
    @ingredients = Ingredient.all
  end

  # GET /factories/1/edit
  def edit
    @factory = Factory.new
    @sauces = Sauce.all
    @ingredients = Ingredient.all
  end

  # POST /factories
  # POST /factories.json
  def create
    status = true
    begin
      Ingredient.transaction do
        (params[:ingredient]||[]).each do |ingredient|

          Factory.create!(
            sauce_id: params[:factory][:sauce_id],
            ingredient_id: ingredient
          )
        end
      end
    rescue 
      status = false
    end
    #@factory = Factory.new(factory_params)
    @sauces = Sauce.all
    @ingredients = Ingredient.all

    

    respond_to do |format|
      if status
        format.html { redirect_to factories_path, notice: 'Factory was successfully created.' }
        format.json { render :show, status: :created, location: @factory }
      else
        format.html { render :new }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factories/1
  # PATCH/PUT /factories/1.json
  def update
    respond_to do |format|
      if @factory.update(factory_params)
        format.html { redirect_to @factory, notice: 'Factory was successfully updated.' }
        format.json { render :show, status: :ok, location: @factory }
      else
        format.html { render :edit }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factories/1
  # DELETE /factories/1.json
  def destroy
    @factory.destroy
    respond_to do |format|
      format.html { redirect_to factories_url, notice: 'Factory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factory_params
      params.require(:factory).permit(:sauce_id, :ingredient_id)
    end
end
