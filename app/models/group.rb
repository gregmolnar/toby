class Group < ActiveRecord::Base
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_and_belongs_to_many :users
end
