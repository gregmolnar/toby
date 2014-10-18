require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  def setup
    super
    @group = groups(:one)
    @invitation = invitations(:one)
  end

  test "should get new" do
    get :new, group_id: @group.id
    assert_response :success
  end

  test "should create invitation" do
    assert_difference('Invitation.count') do
      post :create, invitation: @invitation.attributes, group_id: @group.id
    end

    assert_redirected_to group_users_path(@group.id)
  end

  test "should destroy invitation" do
    @invitation = @group.invitations.create(email: 'foo@bar.com')
    assert_difference('Invitation.count', -1) do
      delete :destroy, id: @invitation, group_id: @group.id
    end

    assert_redirected_to group_users_path(@group.id)
  end
end
