require "test_helper"

class RealEstate::PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deal = real_estate_deals(:one)
    @real_estate_payment = real_estate_payments(:one)
  end

  test "should get index" do
    get real_estate_deal_payments_url(@deal)
    assert_response :success
  end

  test "should get new" do
    get new_real_estate_deal_payment_url(@deal)
    assert_response :success
  end

  test "should create real_estate_payment" do
    assert_difference("RealEstate::Payment.count") do
      post real_estate_deal_payments_url(@deal), params: { real_estate_payment: { amount: @real_estate_payment.amount, date: @real_estate_payment.date } }
    end

    assert_redirected_to real_estate_payment_url(RealEstate::Payment.last)
  end

  test "should show real_estate_payment" do
    get real_estate_payment_url(@real_estate_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_real_estate_payment_url(@real_estate_payment)
    assert_response :success
  end

  test "should update real_estate_payment" do
    patch real_estate_payment_url(@real_estate_payment), params: { real_estate_payment: { amount: @real_estate_payment.amount, date: @real_estate_payment.date, deal_id: @real_estate_payment.deal_id } }
    assert_redirected_to real_estate_payment_url(@real_estate_payment)
  end

  test "should destroy real_estate_payment" do
    assert_difference("RealEstate::Payment.count", -1) do
      delete real_estate_payment_url(@real_estate_payment)
    end

    assert_redirected_to real_estate_deal_payments_url(@deal)
  end
end
