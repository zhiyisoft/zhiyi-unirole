class CreateRoleOrganizations < ActiveRecord::Migration
  def change
    create_table :role_organizations do |t|

      t.timestamps
    end
  end
end
