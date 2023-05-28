class RealEstate::DealsController < ApplicationController
  before_action :set_real_estate_deal, only: %i[ show edit update destroy ]

  # GET /real_estate/deals or /real_estate/deals.json
  def index
    @real_estate_deals = RealEstate::Deal.all
  end

  # GET /real_estate/deals/1 or /real_estate/deals/1.json
  def show
  end

  # GET /real_estate/deals/new
  def new
    @real_estate_deal = RealEstate::Deal.new
  end

  # GET /real_estate/deals/1/edit
  def edit
  end

  # POST /real_estate/deals or /real_estate/deals.json
  def create
    @real_estate_deal = RealEstate::Deal.new(real_estate_deal_params)

    respond_to do |format|
      if @real_estate_deal.save
        format.html { redirect_to real_estate_deal_url(@real_estate_deal), notice: "Deal was successfully created." }
        format.json { render :show, status: :created, location: @real_estate_deal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @real_estate_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_estate/deals/1 or /real_estate/deals/1.json
  def update
    respond_to do |format|
      if @real_estate_deal.update(real_estate_deal_params)
        format.html { redirect_to real_estate_deal_url(@real_estate_deal), notice: "Deal was successfully updated." }
        format.json { render :show, status: :ok, location: @real_estate_deal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @real_estate_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estate/deals/1 or /real_estate/deals/1.json
  def destroy
    @real_estate_deal.destroy

    respond_to do |format|
      format.html { redirect_to real_estate_deals_url, notice: "Deal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate_deal
      @real_estate_deal = RealEstate::Deal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_estate_deal_params
      params.require(:real_estate_deal).permit(:name)
    end
end
