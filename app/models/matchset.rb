#encoding UTF-8
class Matchset < ActiveRecord::Base
  belongs_to :group
  belongs_to :match
end