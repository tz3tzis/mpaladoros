require 'test_helper'

class NotifyControllerTest < ActionDispatch::IntegrationTest
  test "should get push" do
    get notify_push_url
    assert_response :success
  end

end
