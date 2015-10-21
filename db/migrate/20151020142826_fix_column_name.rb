class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :mhds, :type, :mtype
  end
end
