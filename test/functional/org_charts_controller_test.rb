require 'test_helper'

class OrgChartsControllerTest < ActionController::TestCase
  setup do
    @org_chart = org_charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:org_charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org_chart" do
    assert_difference('OrgChart.count') do
      post :create, org_chart: @org_chart.attributes
    end

    assert_redirected_to org_chart_path(assigns(:org_chart))
  end

  test "should show org_chart" do
    get :show, id: @org_chart.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @org_chart.to_param
    assert_response :success
  end

  test "should update org_chart" do
    put :update, id: @org_chart.to_param, org_chart: @org_chart.attributes
    assert_redirected_to org_chart_path(assigns(:org_chart))
  end

  test "should destroy org_chart" do
    assert_difference('OrgChart.count', -1) do
      delete :destroy, id: @org_chart.to_param
    end

    assert_redirected_to org_charts_path
  end
end
