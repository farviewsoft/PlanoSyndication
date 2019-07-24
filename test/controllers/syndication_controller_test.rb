require 'test_helper'

class SyndicationControllerTest < ActionDispatch::IntegrationTest
  test "should get tour_urls" do
    get syndication_tour_urls_url
    assert_response :success
  end

end
