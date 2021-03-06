# coding: UTF-8

class Matchset < ActiveRecord::Base
  validates :group_id, :match_id, presence: true

  belongs_to :group
  belongs_to :match
end