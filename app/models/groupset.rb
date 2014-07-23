#encoding UTF-8
class Groupset < ActiveRecord::Base
	belongs_to :group
	belongs_to :user
end