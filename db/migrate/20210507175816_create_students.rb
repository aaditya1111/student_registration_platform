class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :mobile
      t.string :school_name
      t.integer :class
      t.string :address
      t.integer :roll_no

      t.timestamps
    end
  end
end
