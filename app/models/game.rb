class Game < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
end
