class AddIndexAndUniquenessIndividually < ActiveRecord::Migration[6.0]
  def change
    add_index :students, :email, unique: true
    add_index :students, :mobile, unique: true
  end
end
