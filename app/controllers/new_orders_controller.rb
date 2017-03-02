class NewOrdersController < ApplicationController
  before_action :set_new_order, only: [:show, :edit, :update, :destroy]

  # GET /new_orders
  # GET /new_orders.json
  def index
    @new_orders = NewOrder.all
  end

  # GET /new_orders/1
  # GET /new_orders/1.json
  def show
  end

  # GET /new_orders/new
  def new
    @new_order = NewOrder.new
    @sauces = Sauce.all
    @locations = Location.all
  end

  # GET /new_orders/1/edit
  def edit
    @sauces = Sauce.all
    @locations = Location.all
  end

  # POST /new_orders
  # POST /new_orders.json
  def create
    @new_order = NewOrder.new(new_order_params)
    @sauces = Sauce.all
    @locations = Location.all

    respond_to do |format|
      if @new_order.save
        format.html { redirect_to @new_order, notice: 'New order was successfully created.' }
        format.json { render :show, status: :created, location: @new_order }
      else
        format.html { render :new }
        format.json { render json: @new_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_orders/1
  # PATCH/PUT /new_orders/1.json
  def update
    respond_to do |format|
      if @new_order.update(new_order_params)
        format.html { redirect_to @new_order, notice: 'New order was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_order }
      else
        format.html { render :edit }
        format.json { render json: @new_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_orders/1
  # DELETE /new_orders/1.json
  def destroy
    @new_order.destroy
    respond_to do |format|
      format.html { redirect_to new_orders_url, notice: 'New order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_order
      @new_order = NewOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_order_params
      params.require(:new_order).permit(:sauce_name, :quantity, :destination)
    end
end
