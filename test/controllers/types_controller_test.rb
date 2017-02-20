require 'test_helper'

class TypesControllerTest < ActionController::TestCase
  setup do
    @type = types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:types)
  end

  test "should create type" do
    assert_difference('Type.count') do
      post :create, type: {  }
    end

    assert_response 201
  end

  test "should show type" do
    get :show, id: @type
    assert_response :success
  end

  test "should update type" do
    put :update, id: @type, type: {  }
    assert_response 204
  end

  test "should destroy type" do
    assert_difference('Type.count', -1) do
      delete :destroy, id: @type
    end

    assert_response 204
  end
end
