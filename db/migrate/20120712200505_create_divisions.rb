class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :season_id
      t.integer :current_day, :default => 1

      t.timestamps
    end
  end
end
