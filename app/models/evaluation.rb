class Evaluation < ApplicationRecord
  belongs_to :user

  enum evaluation: [:dislike, :like]
end
