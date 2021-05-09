class ChangeClassToStandard < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :class, :standard
  end
end
