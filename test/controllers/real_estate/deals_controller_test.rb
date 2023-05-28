require "test_helper"

class RealEstate::DealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @real_estate_deal = real_estate_deals(:one)
  end

  test "should get index" do
    get real_estate_deals_url
    assert_response :success
  end

  test "should get new" do
    get new_real_estate_deal_url
    assert_response :success
  end

  test "should create real_estate_deal" do
    assert_difference("RealEstate::Deal.count") do
      post real_estate_deals_url, params: { real_estate_deal: { name: @real_estate_deal.name } }
    end

    assert_redirected_to real_estate_deal_url(RealEstate::Deal.last)
  end

  test "should show real_estate_deal" do
    get real_estate_deal_url(@real_estate_deal)
    assert_response :success
  end

  test "should get edit" do
    get edit_real_estate_deal_url(@real_estate_deal)
    assert_response :success
  end

  test "should update real_estate_deal" do
    patch real_estate_deal_url(@real_estate_deal), params: { real_estate_deal: { name: @real_estate_deal.name } }
    assert_redirected_to real_estate_deal_url(@real_estate_deal)
  end

  test "should destroy real_estate_deal" do
    assert_difference("RealEstate::Deal.count", -1) do
      delete real_estate_deal_url(@real_estate_deal)
    end

    assert_redirected_to real_estate_deals_url
  end
end
