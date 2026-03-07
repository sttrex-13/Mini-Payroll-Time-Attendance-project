class TimeAttendancesController < ApplicationController
  before_action :set_time_attendance, only: %i[ show edit update destroy ]

  # GET /time_attendances or /time_attendances.json
  def index
    @time_attendances = TimeAttendance.all
  end

  # GET /time_attendances/1 or /time_attendances/1.json
  def show
  end

  # GET /time_attendances/new
  def new
    @time_attendance = TimeAttendance.new
  end

  # GET /time_attendances/1/edit
  def edit
  end

  # POST /time_attendances or /time_attendances.json
  def create
    @time_attendance = TimeAttendance.new(time_attendance_params)

    respond_to do |format|
      if @time_attendance.save
        format.html { redirect_to @time_attendance, notice: "Time attendance was successfully created." }
        format.json { render :show, status: :created, location: @time_attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_attendance.errors, status: :unprocessable_entity }
      end
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
      @time_attendance = TimeAttendance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def time_attendance_params
      params.expect(time_attendance: [ :employee_id, :work_date, :check_in_at, :check_out_at, :overtime_hours ])
    end
end
