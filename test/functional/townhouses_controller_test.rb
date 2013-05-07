require 'test_helper'

class TownhousesControllerTest < ActionController::TestCase
  setup do
    @townhouse = townhouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:townhouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create townhouse" do
    assert_difference('Townhouse.count') do
      post :create, townhouse: { information: @townhouse.information, name: @townhouse.name }
    end

    assert_redirected_to townhouse_path(assigns(:townhouse))
  end

  test "should show townhouse" do
    get :show, id: @townhouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @townhouse
    assert_response :success
  end

  test "should update townhouse" do
    put :update, id: @townhouse, townhouse: { information: @townhouse.information, name: @townhouse.name }
    assert_redirected_to townhouse_path(assigns(:townhouse))
  end

  test "should destroy townhouse" do
    assert_difference('Townhouse.count', -1) do
      delete :destroy, id: @townhouse
    end

    assert_redirected_to townhouses_path
  end
end
