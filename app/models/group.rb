#encoding UTF-8
class Group < ActiveRecord::Base
	validates :name, presence: true
	has_many :groupsets
	has_many :users, through: :groupsets

	def create_ranking
		@group=Group.find(self.id)
		@groupsets = Groupset.where(group_id: @group.id)
		@groupsets.each do |g|
			g.points_in_group = 0
			@bets=Bet.where(group_id: g.group_id, user_id: g.user_id)
			@bets.each do |b|
				g.points_in_group += b.points
			end
			g.save
		end
	end
end