require 'test_helper'

class PStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:p_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create p_status" do
    assert_difference('PStatus.count') do
      post :create, :p_status => { }
    end

    assert_redirected_to p_status_path(assigns(:p_status))
  end

  test "should show p_status" do
    get :show, :id => p_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => p_statuses(:one).to_param
    assert_response :success
  end

  test "should update p_status" do
    put :update, :id => p_statuses(:one).to_param, :p_status => { }
    assert_redirected_to p_status_path(assigns(:p_status))
  end

  test "should destroy p_status" do
    assert_difference('PStatus.count', -1) do
      delete :destroy, :id => p_statuses(:one).to_param
    end

    assert_redirected_to p_statuses_path
  end
end
