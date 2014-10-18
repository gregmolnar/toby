class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :sender, class: User
end
