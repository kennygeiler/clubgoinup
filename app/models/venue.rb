class Venue < ActiveRecord::Base
  has_many :goings
  has_many :users, through: :goings
end
