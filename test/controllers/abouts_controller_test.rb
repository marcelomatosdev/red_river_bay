require 'test_helper'

class AboutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get abouts_index_url
    assert_response :success
  end

  test "should get show" do
    get abouts_show_url
    assert_response :success
  end

end
