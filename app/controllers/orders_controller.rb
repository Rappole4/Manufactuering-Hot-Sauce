class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /new_orders
  # GET /new_orders.json
  def index
    @orders = Order.all
  end

  # GET /new_orders/1
  # GET /new_orders/1.json
  def show
  end

  # GET /new_orders/new
  def new
    @order = Order.new
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
    @order = Order.new(order_params)
    @sauces = Sauce.all
    @locations = Location.all

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'New order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_orders/1
  # PATCH/PUT /new_orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'New order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_orders/1
  # DELETE /new_orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'New order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:sauce_id, :quantity, :destination)
    end
end
