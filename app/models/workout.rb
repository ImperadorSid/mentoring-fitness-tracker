class Workout < ApplicationRecord
  belongs_to :user

  has_many :training_sets, dependent: :destroy
  has_many :exercises, through: :training_sets

  validates :name, :date, presence: true

  scope :by_current_week, -> {
    where(
      'date >= ? AND date <= ?',
      Time.current.beginning_of_week,
      Time.current.end_of_week
    )
  }
end
