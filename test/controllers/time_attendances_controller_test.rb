require "test_helper"

class TimeAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_attendance = time_attendances(:one)
    @employee = employees(:one)
  end

  test "should get index" do
    get time_attendances_url
    assert_response :success
  end

  test "should create time_attendance" do
    assert_difference("TimeAttendance.count", 1) do
      post employee_time_attendances_url(@employee), params: {
        time_attendance: {
          employee_id: @employee.id,
          work_date: Date.new(2026, 3, 9),
          check_in_at: Time.zone.local(2026, 3, 9, 9, 0, 0),
          check_out_at: Time.zone.local(2026, 3, 9, 18, 0, 0),
          overtime_hours: 1
        }
      }
    end

    assert_response :redirect
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
    patch time_attendance_url(@time_attendance), params: {
      time_attendance: {
        employee_id: @employee.id,
        work_date: @time_attendance.work_date,
        check_in_at: Time.zone.local(2026, 3, 8, 9, 0, 0),
        check_out_at: Time.zone.local(2026, 3, 8, 18, 0, 0),
        overtime_hours: 1
      }
    }

    assert_response :see_other
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy time_attendance" do
    assert_difference("TimeAttendance.count", -1) do
      delete time_attendance_url(@time_attendance)
    end

    assert_response :see_other
    assert_redirected_to employee_url(@employee)
  end
end