class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.uuid :id
      t.datetime :deleted_at
      t.string :name
      t.integer :rights

      t.timestamps
    end
  end
end
