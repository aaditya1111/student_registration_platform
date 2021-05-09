class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: :create

# Student login authentication api
  def create
    if student = Session.authenticate(params[:email], params[:password])
      token = AuthToken.issue(student_id: student.id)
      $redis.hset(token, 'student_id', student.id)
      $redis.expire(token, 10.days.to_i)
      render json: {student: student, token: token}
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

#Student logout api
  def logout
    $redis.del(current_token)
    render json: {message: 'Student is Logged out successfully'}, status: :ok
  end
end
