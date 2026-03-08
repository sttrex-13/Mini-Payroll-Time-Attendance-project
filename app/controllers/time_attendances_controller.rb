class TimeAttendancesController < ApplicationController
  before_action :set_time_attendance, only: %i[ show edit update destroy ]

  # GET /time_attendances or /time_attendances.json
  def index
    @time_attendances = TimeAttendance.all
  end

  # GET /time_attendances/1 or /time_attendances/1.json
  def show
    @employee = Employee.find(params[:id])

    @today_attendance = @employee.time_attendances
                                 .where(work_date: Date.current, check_out_at: nil)
                                 .order(created_at: :desc)
                                 .first
  end

  # GET /time_attendances/new
  def new
    @employee = Employee.find(params[:employee_id])
    @time_attendance = @employee.time_attendances.build
  end

  # GET /time_attendances/1/edit
  def edit
  end

  # POST /time_attendances or /time_attendances.json
  def create
    @employee = Employee.find(params[:employee_id])
    @time_attendance = @employee.time_attendances.build(time_attendance_params)
    @time_attendance.work_date = Date.current

    if @time_attendance.save
      redirect_to employee_path(@employee), notice: "Attendance record was created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_attendances/1 or /time_attendances/1.json
  def update
    if @time_attendance.update(time_attendance_params)
      redirect_to employee_path(@time_attendance.employee),
                  notice: "Time attendance was successfully updated.",
                  status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /time_attendances/1 or /time_attendances/1.json
  def destroy
    employee = @time_attendance.employee
    @time_attendance.destroy!

    redirect_to employee_path(employee),
                notice: "Time attendance was successfully destroyed.",
                status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_attendance
      @time_attendance = TimeAttendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def time_attendance_params
    params.require(:time_attendance).permit(:work_date, :check_in_at, :check_out_at, :overtime_hours)
  end
end
