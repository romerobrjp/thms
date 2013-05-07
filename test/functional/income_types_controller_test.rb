require 'test_helper'

class IncomeTypesControllerTest < ActionController::TestCase
  setup do
    @income_type = income_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_type" do
    assert_difference('IncomeType.count') do
      post :create, income_type: { description: @income_type.description, name: @income_type.name }
    end

    assert_redirected_to income_type_path(assigns(:income_type))
  end

  test "should show income_type" do
    get :show, id: @income_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_type
    assert_response :success
  end

  test "should update income_type" do
    put :update, id: @income_type, income_type: { description: @income_type.description, name: @income_type.name }
    assert_redirected_to income_type_path(assigns(:income_type))
  end

  test "should destroy income_type" do
    assert_difference('IncomeType.count', -1) do
      delete :destroy, id: @income_type
    end

    assert_redirected_to income_types_path
  end
end
