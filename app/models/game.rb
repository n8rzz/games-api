class Game < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :status, presence: true

  def change_status
    self.update(status: 'ownit')
  end
end
