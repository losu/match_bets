class Bet < ActiveRecord::Base
	validates :user_id, presence: true
	validates :match_id, presence: true
	validates :group_id, presence: true
	validates :team1_score, presence: true
	validates :team2_score, presence: true
	belongs_to :match
	belongs_to :user
	belongs_to :group 
	


end