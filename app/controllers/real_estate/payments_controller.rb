class RealEstate::PaymentsController < ApplicationController
  before_action :set_deal, only: %i[ new create index ]
  before_action :set_real_estate_payment, only: %i[ show edit update destroy ]

  # GET /real_estate/payments or /real_estate/payments.json
  def index
    @real_estate_payments = @deal.payments.order(date: :asc).all
  end

  # GET /real_estate/payments/1 or /real_estate/payments/1.json
  def show
    @deal = @real_estate_payment.deal
  end

  # GET /real_estate/payments/new
  def new
    @real_estate_payment = @deal.payments.build
  end

  # GET /real_estate/payments/1/edit
  def edit
    @deal = @real_estate_payment.deal
  end

  # POST /real_estate/payments or /real_estate/payments.json
  def create
    @real_estate_payment = @deal.payments.build(real_estate_payment_params)

    respond_to do |format|
      if @real_estate_payment.save
        format.html { redirect_to real_estate_payment_url(@real_estate_payment), notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @real_estate_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @real_estate_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_estate/payments/1 or /real_estate/payments/1.json
  def update
    respond_to do |format|
      if @real_estate_payment.update(real_estate_payment_params)
        format.html { redirect_to real_estate_payment_url(@real_estate_payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @real_estate_payment }
      else
        format.html do
          @deal = @real_estate_payment.deal
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @real_estate_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estate/payments/1 or /real_estate/payments/1.json
  def destroy
    @real_estate_payment.destroy

    respond_to do |format|
      format.html { redirect_to real_estate_deal_payments_url(@real_estate_payment.deal), notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_deal
    @deal = RealEstate::Deal.find(params[:deal_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_real_estate_payment
    @real_estate_payment = RealEstate::Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def real_estate_payment_params
    params.require(:real_estate_payment).permit(:amount, :date)
  end
end
