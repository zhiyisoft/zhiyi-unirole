class CreateRoleRanks < ActiveRecord::Migration
  def change
    create_table :role_ranks do |t|

      t.timestamps
    end
  end
end
