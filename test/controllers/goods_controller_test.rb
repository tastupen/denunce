require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get good" do
    get goods_good_url
    assert_response :success
  end

end
