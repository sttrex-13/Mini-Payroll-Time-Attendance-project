require "test_helper"

class EmployeesHelperTest < ActionView::TestCase
  include EmployeesHelper

  test "should total_overtime_hours returns sum of overtime hours as float" do
    employee = Employee.create!(
      user_name: "john01",
      first_name: "John",
      last_name: "Doe",
      position: "Developer",
      salary: 30000
    )

    employee.time_attendances.create!(
      work_date: Date.current,
      check_in_at: Time.current,
      check_out_at: Time.current + 8.hours,
      overtime_hours: 0
    )

    employee.time_attendances.create!(
      work_date: Date.current + 1.day,
      check_in_at: Time.current,
      check_out_at: Time.current + 9.hours,
      overtime_hours: 1
    )

    assert_equal 1, total_overtime_hours(employee)
  end

  test "should overtime_pay returns 0 when salary is blank" do
    employee = Employee.new(
      user_name: "john02",
      first_name: "John",
      last_name: "Doe",
      position: "Developer",
      salary: nil
    )

    assert_equal 0, overtime_pay(employee)
  end

  test "should overtime_pay calculates correctly" do
    employee = Employee.create!(
      user_name: "john03",
      first_name: "John",
      last_name: "Doe",
      position: "Developer",
      salary: 24000
    )

    employee.time_attendances.create!(
      work_date: Date.current,
      check_in_at: Time.current,
      check_out_at: Time.current + 10.hours,
      overtime_hours: 2
    )
    assert_equal 200.0, overtime_pay(employee)
  end

  test "should tax_amount returns 0 when salary is less than or equal to 30000" do
    employee = Employee.new(salary: 30000)
    assert_equal 0, tax_amount(employee)
  end

  test "should tax_amount calculates 5 percent for salary between 30001 and 50000" do
    employee = Employee.new(salary: 40000)
    assert_equal 500.0, tax_amount(employee)
  end

  test "should tax_amount calculates progressive tax for salary greater than 50000" do
    employee = Employee.new(salary: 60000)
    assert_equal 2000.0, tax_amount(employee)
  end

  test "should net_pay calculates correctly" do
    employee = Employee.create!(
      user_name: "john04",
      first_name: "John",
      last_name: "Doe",
      position: "Developer",
      salary: 60000
    )

    employee.time_attendances.create!(
      work_date: Date.current,
      check_in_at: Time.current,
      check_out_at: Time.current + 10.hours,
    )
    assert_equal 58500.0, net_pay(employee)
  end
end