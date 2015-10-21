class CreateCmds < ActiveRecord::Migration
  def change
    create_table :cmds do |t|
      t.string :name
      t.string :option
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
