class Session
  #Class method for Session service
  def self.authenticate(email, password)
    return false if email.blank? || password.blank?
    student = Student.find_by(email: email)
    student && student.authenticate(password) ? student : false
  end
end
