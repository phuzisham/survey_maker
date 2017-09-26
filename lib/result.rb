class Result < ActiveRecord::Base
  belongs_to(:answer)
  has_many(:results)
end
