class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :location
      t.string :email
      t.timestamps
    end
  end
end
