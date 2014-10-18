class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :owned_groups, ->{ where("groups_users.admin = 1") }, through: :groups_users, source: :group
  has_many :passwords
end
