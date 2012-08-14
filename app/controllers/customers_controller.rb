class CustomersController < ApplicationController

  respond_to :html, :json, :xml

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    flash[:success] = "Customer created!" if @customer.save
    respond_with(@customer)
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with(@customer)
  end

  def index
    @customers = Customer.all
    respond_with(@customers)
  end

end
