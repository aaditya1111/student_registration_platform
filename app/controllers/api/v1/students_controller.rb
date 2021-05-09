class Api::V1::StudentsController < ApplicationController
  skip_before_action :authenticate, only: [:create, :index]

#Listing all Students in sorted order of created_date(descending)
  def index
    students = Student.order("created_at DESC")
    @count = students.count

    render json: {status: 'SUCCESS', message:'Students list', total_students: @count, data:students}, status: :ok
  end

#Get student by id
  def show
    student = Student.find(params[:id])

    render json: {status: 'SUCCESS', message:"Student listed with name #{student.name}", data:student}, status: :ok
  end

#Add student by filling details
  def create
    validate_student(student_params)
    begin
      student = Student.create!(student_params)

      render json: {status: 'SUCCESS', message:"Student registered Successfully with name #{student.name}", data:student.reload}, status: :ok
    rescue => error
      render json: {message: error}
    end
  end

#Update student by id
  def update
    begin
      student = Student.find(params[:id])
      student.update_attributes!(student_params)

      render json: {status: 'SUCCESS', message:"Student updated Successfully with name #{student.name}", data:student}, status: :ok
    rescue => error
      render json: {status: 'ERROR', message:'Student Update failed!', data:error}, status: :unprocessable_entity
    end
  end

#Deleting student by id
  def destroy
    begin
      student = Student.find(params[:id])
      student.destroy!

      render json: {status: 'SUCCESS', message:"Student deleted Successfully with name #{student.name}"}, status: :ok
    rescue => error
      render json: {status: 'ERROR', message:'Student Update failed!', data:error}, status: :unprocessable_entity
    end
  end


  private

  def student_params
    params.permit(:name, :email, :password, :mobile, :school_name, :standard, :address, :roll_no)
  end

#Validating Student add params
  def validate_student(student_params)
    mobile_number_regex = /^[1-9]\d{9}$/
    email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    render json: {error: "Please enter name"}, status: :bad_request if params[:name].blank?
    render json: {error: "Please enter email in right format"}, status: :bad_request if params[:name].blank? || !params[:email].match(email_regex)
    puts params[:password].size()
    render json: {error: "Please enter a valid password"}, status: :bad_request if params[:password].blank? || !(params[:password].size() > 7)
    render json: {error: "Please enter valid mobile_number"}, status: :bad_request if params[:mobile].blank? || !params[:mobile].match(mobile_number_regex)
    render json: {error: "Please enter school_name"}, status: :bad_request if params[:school_name].blank?
    render json: {error: "Please enter class"}, status: :bad_request if params[:standard].blank?
    render json: {error: "Please enter address"}, status: :bad_request if params[:address].blank?
    render json: {error: "Please enter roll_no"}, status: :bad_request if params[:roll_no].blank?
  end
end
