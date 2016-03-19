class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games, id: :uuid do |t|
      t.string :title
      t.integer :votes
      t.string :status

      t.timestamps
    end
  end
end
