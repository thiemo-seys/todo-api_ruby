class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users ,id: false do |t|
      t.uuid :id
      t.string :name
      t.string :email
      t.string :password_digest
      t.uuid :role_id

      t.timestamps
    end
  end
end
