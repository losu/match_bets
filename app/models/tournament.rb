# coding: UTF-8

class Tournament < ActiveRecord::Base
  validates :name, presence: true

  has_many :matches
end