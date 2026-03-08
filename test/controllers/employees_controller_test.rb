require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count", 1) do
      post employees_url, params: {
        employee: {
          first_name: "John",
          last_name: "Doe",
          position: "Developer",
          salary: 30000,
          user_name: "john_doe_test"
        }
      }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    skip
    patch employee_url(@employee), params: {
      employee: {
        first_name: "Updated",
        last_name: @employee.last_name,
        position: @employee.position,
        salary: @employee.salary,
        user_name: @employee.user_name
      }
    }

    assert_response :see_other
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_response :see_other
    assert_redirected_to employees_url
  end
end