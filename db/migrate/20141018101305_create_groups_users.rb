class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.belongs_to :group, index: true
      t.belongs_to :user, index: true
      t.boolean :admin, default: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :groups_users, :admin
  end
end
