require 'test_helper'

class PlaceControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
