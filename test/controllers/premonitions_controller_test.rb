require 'test_helper'

class PremonitionsControllerTest < ActionController::TestCase
  setup do
    @premonition = premonitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premonitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premonition" do
    assert_difference('Premonition.count') do
      post :create, premonition: { date: @premonition.date, description: @premonition.description, location_premonition: @premonition.location_premonition, location_user: @premonition.location_user, more_premonitions: @premonition.more_premonitions, own_conclusions: @premonition.own_conclusions, premonition_come_true: @premonition.premonition_come_true, premonition_come_true_description: @premonition.premonition_come_true_description, someone_else: @premonition.someone_else, status: @premonition.status, tags: @premonition.tags, title: @premonition.title, type: @premonition.type, type_description: @premonition.type_description }
    end

    assert_redirected_to premonition_path(assigns(:premonition))
  end

  test "should show premonition" do
    get :show, id: @premonition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premonition
    assert_response :success
  end

  test "should update premonition" do
    patch :update, id: @premonition, premonition: { date: @premonition.date, description: @premonition.description, location_premonition: @premonition.location_premonition, location_user: @premonition.location_user, more_premonitions: @premonition.more_premonitions, own_conclusions: @premonition.own_conclusions, premonition_come_true: @premonition.premonition_come_true, premonition_come_true_description: @premonition.premonition_come_true_description, someone_else: @premonition.someone_else, status: @premonition.status, tags: @premonition.tags, title: @premonition.title, type: @premonition.type, type_description: @premonition.type_description }
    assert_redirected_to premonition_path(assigns(:premonition))
  end

  test "should destroy premonition" do
    assert_difference('Premonition.count', -1) do
      delete :destroy, id: @premonition
    end

    assert_redirected_to premonitions_path
  end
end
