require 'test_helper'

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get weather_form_url
    assert_response :success
  end

  test "should get display" do
    get weather_display_url
    assert_response :success
  end

end
