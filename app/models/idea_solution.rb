class IdeaSolution < ActiveRecord::Base
  belongs_to :idea
  belongs_to :solution
end