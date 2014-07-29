class Match < ActiveRecord::Base

	validates :team_name_1, presence: true
	validates :team_name_2, presence: true
	validates :deadline, presence: true
	validates :team_score_1, presence: true
	validates :team_score_2, presence: true
	validate :check_team
	# :deadline
	# :team_score_1
	# :team_score_2

	def evaluate_points
			@match=Match.find(self.id)
			@bets=Bet.where(match_id: @match.id)
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
				b.save
			end
	end

	def check_team
		if team_name_1==team_name_2
			 errors.add(:team_name_2, "nie momzna dodac 2 takich samych druzyn")
		end
	end


	protected
		def set_scores_to_zero
			self.team_score_1 = 0
			self.team_score_2 = 0
		end	

		def check_teams?
			if self.team_name_1 == "sss" 
			return false
		end
		end

end