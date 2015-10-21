class AddUserIdColumnToErors < ActiveRecord::Migration
  def change
    add_column :erors, :user_id, :integer
  end
end
