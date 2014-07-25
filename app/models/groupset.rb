#encoding UTF-8
class Groupset < ActiveRecord::Base
  validates :group_id, presence: true
  validates :user_id, presence: true
	belongs_to :group
	belongs_to :user
end