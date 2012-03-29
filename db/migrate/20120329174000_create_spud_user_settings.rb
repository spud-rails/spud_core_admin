class CreateSpudUserSettings < ActiveRecord::Migration
  def change
    create_table :spud_user_settings do |t|
      t.integer :spud_user_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
