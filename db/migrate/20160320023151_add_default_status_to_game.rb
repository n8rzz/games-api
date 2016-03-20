class AddDefaultStatusToGame < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :status, :string, :default => 'wantit'
  end
end
