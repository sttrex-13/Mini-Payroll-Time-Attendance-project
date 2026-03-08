json.extract! time_attendance, :id, :employee_id, :work_date, :check_in_at, :check_out_at, :overtime_hours, :created_at, :updated_at
json.url time_attendance_url(time_attendance, format: :json)
