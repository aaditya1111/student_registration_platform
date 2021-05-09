class Student < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile, presence: true
  validates :school_name, presence: true
  validates :standard, presence: true
  validates :address, presence: true
  validates :roll_no, presence: true
end
