class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :number
      t.string :name
      t.string :photo
      t.integer :team_id

      t.timestamps
    end
  end
end
