class AddIndexAndUniqueness < ActiveRecord::Migration[6.0]
  def change
    add_index :students, [:email, :mobile], unique: true
  end
end
