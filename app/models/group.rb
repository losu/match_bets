#encoding UTF-8
class Group < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :user
end