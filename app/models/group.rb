class Group < ActiveRecord::Base
  has_many :invitations, dependent: :destroy
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :admins, ->{ where("groups_users.admin = 1") }, through: :groups_users, source: :user
end
