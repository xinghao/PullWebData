require 'test_helper'

class RelateMusicbrainzsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relate_musicbrainzs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relate_musicbrainz" do
    assert_difference('RelateMusicbrainz.count') do
      post :create, :relate_musicbrainz => { }
    end

    assert_redirected_to relate_musicbrainz_path(assigns(:relate_musicbrainz))
  end

  test "should show relate_musicbrainz" do
    get :show, :id => relate_musicbrainzs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => relate_musicbrainzs(:one).to_param
    assert_response :success
  end

  test "should update relate_musicbrainz" do
    put :update, :id => relate_musicbrainzs(:one).to_param, :relate_musicbrainz => { }
    assert_redirected_to relate_musicbrainz_path(assigns(:relate_musicbrainz))
  end

  test "should destroy relate_musicbrainz" do
    assert_difference('RelateMusicbrainz.count', -1) do
      delete :destroy, :id => relate_musicbrainzs(:one).to_param
    end

    assert_redirected_to relate_musicbrainzs_path
  end
end
