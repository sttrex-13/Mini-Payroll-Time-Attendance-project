class TimeAttendancesController < ApplicationController
  before_action :set_time_attendance, only: %i[ show edit update destroy ]

  # GET /time_attendances or /time_attendances.json
  def index
    @time_attendances = TimeAttendance.all
  end

  # GET /time_attendances/1 or /time_attendances/1.json
  def show
    @employee = Employee.find(params[:id])
    @today_attendance = @employee.time_attendances.find_by(work_date: Date.current)
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
    respond_to do |format|
      if @time_attendance.update(time_attendance_params)
        format.html { redirect_to @time_attendance, notice: "Time attendance was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @time_attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_attendances/1 or /time_attendances/1.json
  def destroy
    @time_attendance.destroy!

    respond_to do |format|
      format.html { redirect_to time_attendances_path, notice: "Time attendance was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
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
