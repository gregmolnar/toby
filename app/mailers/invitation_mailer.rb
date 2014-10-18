class InvitationMailer < ActionMailer::Base
  default from: "noreply@toby.toby"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitations.invite.subject
  #
  def invite(invitation)
    @invitation = invitation
    mail to: invitation.email
  end
end
