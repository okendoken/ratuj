class PaymentsController < ApplicationController

  before_filter :authenticate_user!
  # GET /payments
  # GET /payments.json
  def index
    @payments = current_user.payments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = current_user.payments.new(params[:payment])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to payments_path, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end
end
