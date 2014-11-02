require 'test_helper'

class PasswordsControllerTest < ActionController::TestCase
  def setup
    super
    @password = passwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @password
    assert_response :success
  end

  test "should destroy password" do
    assert_difference('Password.count', -1) do
      delete :destroy, id: @password
    end
    assert_redirected_to passwords_path
  end

end
