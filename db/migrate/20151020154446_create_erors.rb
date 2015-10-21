class CreateErors < ActiveRecord::Migration
  def change
    create_table :erors do |t|
      t.string :name
      t.text :description
      t.string :cause
      t.string :fix

      t.timestamps null: false
    end
  end
end
