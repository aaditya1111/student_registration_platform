class ChangeMobileToString < ActiveRecord::Migration[6.0]
  def change
    change_column :students, :mobile, :string
  end
end
