class RollbackStudentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :mobile
      t.string :school_name
      t.integer :standard
      t.string :address
      t.integer :roll_no

      t.timestamps
    end
  end
end
