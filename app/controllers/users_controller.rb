class UsersController < ApplicationController
  load_and_authorize_resource :group
  load_and_authorize_resource :user, through: :group
  before_action :set_group

  def index
    @users = @group.users.all
    @invitation = Invitation.new
  end

  def destroy
    @group.users.delete(@group.users.find(params[:id]))
    redirect_to group_users_path(@group)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = current_user.groups.find(params[:group_id])
    end
end
