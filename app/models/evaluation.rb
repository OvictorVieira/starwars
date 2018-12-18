class Evaluation < ApplicationRecord

  MAX_EVALUATION = 2

  belongs_to :user

  enum evaluation: [:dislike, :like]
end
