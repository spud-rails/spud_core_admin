class AddTimeZoneToSpudUser < ActiveRecord::Migration
  def change
    add_column :spud_users, :time_zone, :string

  end
end
