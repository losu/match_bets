#encoding UTF-8
class Matchset < ActiveRecord::Base
  validates :group_id, presence: true
  validates :match_id, presence: true
  belongs_to :group
  belongs_to :match
end