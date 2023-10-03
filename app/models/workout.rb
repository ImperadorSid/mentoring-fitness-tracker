class Workout < ApplicationRecord
  belongs_to :user

  has_many :training_sets, dependent: :destroy
  has_many :exercises, through: :training_sets

  validates :name, :date, presence: true
end
