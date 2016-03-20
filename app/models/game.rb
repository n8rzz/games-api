class Game < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :status, presence: true
end
