class CreateRoleRoles < ActiveRecord::Migration
  def change
    create_table :role_roles do |t|

      t.timestamps
    end
  end
end
