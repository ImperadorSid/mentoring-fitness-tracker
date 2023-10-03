class Exercise < ApplicationRecord
  has_many :training_sets
  has_many :workouts, through: :training_sets

  validates :name, :description, presence: true, uniqueness: true
end
