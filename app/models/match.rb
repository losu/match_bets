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