require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_index_url
    assert_response :success
  end

  test "should get dashboard" do
    get main_dashboard_url
    assert_response :success
  end

  test "should get choose-song" do
    get main_choose-song_url
    assert_response :success
  end

  test "should get record" do
    get main_record_url
    assert_response :success
  end

  test "should get mix" do
    get main_mix_url
    assert_response :success
  end

end
