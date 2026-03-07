require "test_helper"

class TimeAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_attendance = time_attendances(:one)
  end

  test "should get index" do
    get time_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_time_attendance_url
    assert_response :success
  end

  test "should create time_attendance" do
    assert_difference("TimeAttendance.count") do
      post time_attendances_url, params: { time_attendance: { check_in_at: @time_attendance.check_in_at, check_out_at: @time_attendance.check_out_at, employee_id: @time_attendance.employee_id, overtime_hours: @time_attendance.overtime_hours, work_date: @time_attendance.work_date } }
    end

    assert_redirected_to time_attendance_url(TimeAttendance.last)
  end

  test "should show time_attendance" do
    get time_attendance_url(@time_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_attendance_url(@time_attendance)
    assert_response :success
  end

  test "should update time_attendance" do
    patch time_attendance_url(@time_attendance), params: { time_attendance: { check_in_at: @time_attendance.check_in_at, check_out_at: @time_attendance.check_out_at, employee_id: @time_attendance.employee_id, overtime_hours: @time_attendance.overtime_hours, work_date: @time_attendance.work_date } }
    assert_redirected_to time_attendance_url(@time_attendance)
  end

  test "should destroy time_attendance" do
    assert_difference("TimeAttendance.count", -1) do
      delete time_attendance_url(@time_attendance)
    end

    assert_redirected_to time_attendances_url
  end
end
