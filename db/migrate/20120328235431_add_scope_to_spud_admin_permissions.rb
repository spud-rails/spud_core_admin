class AddScopeToSpudAdminPermissions < ActiveRecord::Migration
  def change
    add_column :spud_admin_permissions, :scope, :string

  end
end
