# coding: UTF-8

class Match < ActiveRecord::Base
	validates :team_name_1, :team_name_2,
						:deadline, :team_score_1,
					  :team_score_2, presence: true
	validate :check_team

	belongs_to :tournament

	def evaluate_points
			@match=Match.find(self.id)
			@bets=Bet.where(match_id: @match.id, evaluated: false)
			@bets.each do |b|
					if ((b.team_score1 == @match.team_score_1) && (b.team_score2 == @match.team_score_2))
						b.points = 4
					elsif ((b.team_score1 > b.team_score2) && (@match.team_score_1 > @match.team_score_2))
						b.points = 1
					elsif ((b.team_score1 < b.team_score2) && (@match.team_score_1 < @match.team_score_2))
						b.points = 1
					elsif ((b.team_score1 == b.team_score2) && (@match.team_score_1 == @match.team_score_2))
						b.points = 1
					else
						b.points = 0
					end
					b.evaluated  = true
				b.save
			end
			@match.evaluated = true
			@match.save
	end

	def check_team
		if team_name_1.blank? || team_name_2.blank?
			errors.add(:Error, "Name can't be blank")
		elsif team_name_1.downcase==team_name_2.downcase
			errors.add(:Error, "You can't add match with both teams having the same name")
		end
	end

	protected

	def set_scores_to_zero
		self.team_score_1 = 0
		self.team_score_2 = 0
	end	


end