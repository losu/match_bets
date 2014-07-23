#encoding UTF-8
class Group < ActiveRecord::Base
	validates :name, presence: true
	has_many :groupsets
	has_many :users, through: :groupsets
end