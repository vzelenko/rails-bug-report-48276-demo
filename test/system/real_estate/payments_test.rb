require "application_system_test_case"

class RealEstate::PaymentsTest < ApplicationSystemTestCase
  setup do
    @deal = real_estate_deals(:one)
    @real_estate_payment = real_estate_payments(:one)
  end

  test "visiting the index" do
    visit real_estate_deal_payments_url(@deal)
    assert_selector "h1", text: "Payments"
  end

  test "should create payment" do
    visit real_estate_deal_payments_url(@deal)
    click_on "New payment"

    fill_in "Amount", with: @real_estate_payment.amount
    fill_in "Date", with: @real_estate_payment.date
    click_on "Create Payment"

    assert_text "Payment was successfully created"
    click_on "Back to payments"
  end

  test "should update Payment" do
    visit real_estate_payment_url(@real_estate_payment)
    click_on "Edit this payment", match: :first

    fill_in "Amount", with: @real_estate_payment.amount
    fill_in "Date", with: @real_estate_payment.date
    click_on "Update Payment"

    assert_text "Payment was successfully updated"
    click_on "Back to payments"
  end

  test "should destroy Payment" do
    visit real_estate_payment_url(@real_estate_payment)
    click_on "Destroy this payment", match: :first

    assert_text "Payment was successfully destroyed"
  end
end
