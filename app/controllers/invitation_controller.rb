class InvitationController < Devise::RegistrationsController
  layout 'login'
  def invitation
    @invitation = Invitation.where(token: params[:invitation][:token]).first
    if @invitation.nil?
      flash[:alert] = 'Invalid token'
      redirect_to root_url
      return
    end
    unless @invitation.user.nil?
      @invitation.project.users<< @invitation.user unless @invitation.group.users.include? @invitation.user
      @invitation.destroy
      redirect_to new_user_session_path
    end
    @user = User.new(email: @invitation.email)
  end

  def register_invitation
    @invitation = Invitation.where(token: params[:invitation][:token]).first
    @user = User.new user_params
    @user.email = @invitation.email
    if @user.save
      if @user.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(:user, @user)
        @invitation.project.users<< @user
        @invitation.destroy
        respond_with @user, :location => after_sign_up_path_for(@user)
      else
        set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with @user, :location => after_inactive_sign_up_path_for(@user)
      end
    else
      render :invitation
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
