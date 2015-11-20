class Solution < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  has_many :idea_solutions
  has_many :ideas, through: :idea_solutions
end