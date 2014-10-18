class GroupsUser < ActiveRecord::Base
  belongs_to :group, inverse_of: :groups_users
  belongs_to :user, inverse_of: :groups_users
end
