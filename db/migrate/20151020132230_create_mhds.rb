class CreateMhds < ActiveRecord::Migration
  def change
    create_table :mhds do |t|
      t.string :name
      t.string :type
      t.string :value
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
