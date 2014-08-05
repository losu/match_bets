# coding: UTF-8

class Bet < ActiveRecord::Base
	validates :user_id, :match_id, 
            :group_id, :team_score1, 
            :team_score2, presence: true

	belongs_to :match
	belongs_to :user
	belongs_to :group 

end