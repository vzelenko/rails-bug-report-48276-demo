require "application_system_test_case"

class RealEstate::DealsTest < ApplicationSystemTestCase
  setup do
    @real_estate_deal = real_estate_deals(:one)
  end

  test "visiting the index" do
    visit real_estate_deals_url
    assert_selector "h1", text: "Deals"
  end

  test "should create deal" do
    visit real_estate_deals_url
    click_on "New deal"

    fill_in "Name", with: @real_estate_deal.name
    click_on "Create Deal"

    assert_text "Deal was successfully created"
    click_on "Back"
  end

  test "should update Deal" do
    visit real_estate_deal_url(@real_estate_deal)
    click_on "Edit this deal", match: :first

    fill_in "Name", with: @real_estate_deal.name
    click_on "Update Deal"

    assert_text "Deal was successfully updated"
    click_on "Back"
  end

  test "should destroy Deal" do
    visit real_estate_deal_url(@real_estate_deal)
    click_on "Destroy this deal", match: :first

    assert_text "Deal was successfully destroyed"
  end
end
