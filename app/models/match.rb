class Match < ActiveRecord::Base
	before_validation :set_scores_to_zero, :set_date

	validates :team_name_1, presence: true
	validates :team_name_2, presence: true
	validates :deadline, presence: true
	validates :team_score_1, presence: true
	validates :team_score_2, presence: true
	# :deadline
	# :team_score_1
	# :team_score_2

	def evaluate_points()
		# if current_user.admin
			@match=Match.find(self.id)
			@bets=Bet.where(match_id: @match.id)
			@bets.each do |b|
				if @match.deadline > Time.now
					if (b.team_score1 == @match.team_score_1) && (b.team_score2 == @match.team_score_2)
						b.points = 4
					elsif (b.team_score1 > b.team_score2) && (@match.team_score_1 > @match.team_score_2)
						b.points = 1
					elsif (b.team_score1 < b.team_score2) && (@match.team_score_1 < @match.team_score_2)
						b.points = 1
					elsif (b.team_score1 == b.team_score2) && (@match.team_score_1 == @match.team_score_2)
						b.points = 1
					end
					b.save
					redirect_to root_url, notice: "poszly"
				else
					redirect_to root_url, notice: "mecz jeszcze sie nie skonczyl"
				end
			end
		# else 
		# 	redirect_to root_url, alert: "nie masz uprawnien do tego"		
		# end
	end



	protected
		def set_scores_to_zero
			self.team_score_1 = 0
			self.team_score_2 = 0
		end	

		def set_date
			self.deadline = Date.tomorrow
		end

		def check_teams?
			if self.team_name_1 == "sss" 
			return false
		end
		end

end