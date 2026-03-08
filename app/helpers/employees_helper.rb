module EmployeesHelper
  def total_overtime_hours(employee)
    employee.time_attendances.sum(:overtime_hours).to_f
  end

  def overtime_pay(employee)
    return 0 if employee.salary.blank?

    hourly_rate = employee.salary.to_f / 30 / 8
    (total_overtime_hours(employee) * hourly_rate).round(2)
  end

  def tax_amount(employee)
    salary = employee.salary.to_f

    if salary <= 30_000
      0
    elsif salary <= 50_000
      ((salary - 30_000) * 0.05).round(2)
    else
      ((20_000 * 0.05) + ((salary - 50_000) * 0.10)).round(2)
    end
  end

  def net_pay(employee)
    (employee.salary.to_f + overtime_pay(employee) - tax_amount(employee)).round(2)
  end
end
