require 'test_helper'

class StepIngredientsControllerTest < ActionController::TestCase
  setup do
    @step_ingredient = step_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:step_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step_ingredient" do
    assert_difference('StepIngredient.count') do
      post :create, :step_ingredient => @step_ingredient.attributes
    end

    assert_redirected_to step_ingredient_path(assigns(:step_ingredient))
  end

  test "should show step_ingredient" do
    get :show, :id => @step_ingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @step_ingredient.to_param
    assert_response :success
  end

  test "should update step_ingredient" do
    put :update, :id => @step_ingredient.to_param, :step_ingredient => @step_ingredient.attributes
    assert_redirected_to step_ingredient_path(assigns(:step_ingredient))
  end

  test "should destroy step_ingredient" do
    assert_difference('StepIngredient.count', -1) do
      delete :destroy, :id => @step_ingredient.to_param
    end

    assert_redirected_to step_ingredients_path
  end
end
