class TrainingSet < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  validates :workout_id, :exercise_id, presence: true
end
