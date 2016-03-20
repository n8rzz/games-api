class AddDefaultVotesToGames < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :votes, :integer, :default => 0
  end
end
