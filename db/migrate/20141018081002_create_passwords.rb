class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :title
      t.string :username
      t.text :password
      t.text :url
      t.text :comment
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
