class Bet < ActiveRecord::Base
	validates :user_id, presence: true
	validates :match_id, presence: true
	validates :group_id, presence: true
	validates :team_score1, presence: true
	validates :team_score2, presence: true
	belongs_to :match
	belongs_to :user
	belongs_to :group 

end