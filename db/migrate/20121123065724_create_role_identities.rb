class CreateRoleIdentities < ActiveRecord::Migration
  def change
    create_table :role_identities do |t|

      t.timestamps
    end
  end
end
