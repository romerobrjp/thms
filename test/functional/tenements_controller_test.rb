require 'test_helper'

class TenementsControllerTest < ActionController::TestCase
  setup do
    @tenement = tenements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenement" do
    assert_difference('Tenement.count') do
      post :create, tenement: {  }
    end

    assert_redirected_to tenement_path(assigns(:tenement))
  end

  test "should show tenement" do
    get :show, id: @tenement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenement
    assert_response :success
  end

  test "should update tenement" do
    put :update, id: @tenement, tenement: {  }
    assert_redirected_to tenement_path(assigns(:tenement))
  end

  test "should destroy tenement" do
    assert_difference('Tenement.count', -1) do
      delete :destroy, id: @tenement
    end

    assert_redirected_to tenements_path
  end
end
