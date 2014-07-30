#encoding UTF-8
class Matchset < ActiveRecord::Base
  default_scope order('points_in_group DESC')
  validates :group_id, presence: true
  validates :match_id, presence: true
  belongs_to :group
  belongs_to :match
end