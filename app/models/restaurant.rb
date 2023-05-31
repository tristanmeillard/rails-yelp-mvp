class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: %w(chinese italian japanese french belgian)}
  validates :name, presence: true, length: { minimum: 1 }
end
