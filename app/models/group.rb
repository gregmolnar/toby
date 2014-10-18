class Group < ActiveRecord::Base
  belongs_to :user
  has_many :invitations, dependent: :destroy
end
