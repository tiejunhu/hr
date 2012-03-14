require 'test_helper'

class HumenSyncsControllerTest < ActionController::TestCase
  setup do
    @humen_sync = humen_syncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:humen_syncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create humen_sync" do
    assert_difference('HumenSync.count') do
      post :create, humen_sync: @humen_sync.attributes
    end

    assert_redirected_to humen_sync_path(assigns(:humen_sync))
  end

  test "should show humen_sync" do
    get :show, id: @humen_sync.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @humen_sync.to_param
    assert_response :success
  end

  test "should update humen_sync" do
    put :update, id: @humen_sync.to_param, humen_sync: @humen_sync.attributes
    assert_redirected_to humen_sync_path(assigns(:humen_sync))
  end

  test "should destroy humen_sync" do
    assert_difference('HumenSync.count', -1) do
      delete :destroy, id: @humen_sync.to_param
    end

    assert_redirected_to humen_syncs_path
  end
end
