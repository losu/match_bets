# coding: UTF-8

class Group < ActiveRecord::Base
	validates :name, :owner, presence: true
	
	has_many :groupsets
	has_many :users, through: :groupsets
	has_many :invites

	def create_ranking
		@groupsets = Groupset.where(group_id: self.id)
		unless @groupsets.blank?
			@groupsets.each do |g|
				g.points_in_group = 0
				@bets=Bet.where(group_id: g.group_id, user_id: g.user_id)
				unless @bets.blank? == 0
					@bets.each do |b|
						g.points_in_group += b.points.to_i
					end
				end
				g.save
			end
		end
	end
end