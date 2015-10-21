class CreateConventions < ActiveRecord::Migration
  def change
    create_table :conventions do |t|
      t.string :ctlr
      t.string :action
      t.string :views
      t.string :uri
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
