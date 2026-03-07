class PagesController < ApplicationController
  def home
    @employee = Employee.new
  end

  def login
    username = params[:username]&.strip
    employee = Employee.find_by(user_name: username)

    if !employee
      flash.now[:alert] = "Username not found"
      return render :home, status: :unprocessable_entity
    end

    if employee.position == "admin"
      redirect_to employees_path
    else
      Rails.logger.debug "redirect to show #{employee.id}"
      redirect_to employee_path(employee)
    end
  end

end
