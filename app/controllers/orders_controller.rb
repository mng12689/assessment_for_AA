class OrdersController < ApplicationController

  respond_to :html, :json, :xml

  def new
    @order = Order.new
  end

  def create 
    @order = Order.new(params[:order])
    flash[:success] = "Order confirmed!" if @order.save
    respond_with(@order)
  end

  def show
    @order = Order.find(params[:id])
    respond_with(@order)
  end
  
  def index 
    @orders = Order.all
    respond_with(@orders)
  end

end
