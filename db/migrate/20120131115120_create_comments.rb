class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :commentable, :polymorphic => true

      t.timestamps
    end
  end
end
