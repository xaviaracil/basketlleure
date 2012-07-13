class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :local_id
      t.integer :visitor_id
      t.datetime :date
      t.integer :local_score
      t.integer :visitor_score
      t.integer :division_id
      t.integer :day

      t.timestamps
    end
  end
end
