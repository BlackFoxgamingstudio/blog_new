class Vertical < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  has_many :idea_verticals
  has_many :ideas, through: :idea_verticals
end