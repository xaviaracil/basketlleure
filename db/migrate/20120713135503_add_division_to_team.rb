class AddDivisionToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :division_id, :integer
  end
end
