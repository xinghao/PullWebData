require 'test_helper'

class PStatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:p_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create p_stat" do
    assert_difference('PStat.count') do
      post :create, :p_stat => { }
    end

    assert_redirected_to p_stat_path(assigns(:p_stat))
  end

  test "should show p_stat" do
    get :show, :id => p_stats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => p_stats(:one).to_param
    assert_response :success
  end

  test "should update p_stat" do
    put :update, :id => p_stats(:one).to_param, :p_stat => { }
    assert_redirected_to p_stat_path(assigns(:p_stat))
  end

  test "should destroy p_stat" do
    assert_difference('PStat.count', -1) do
      delete :destroy, :id => p_stats(:one).to_param
    end

    assert_redirected_to p_stats_path
  end
end
