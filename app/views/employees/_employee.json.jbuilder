json.extract! employee, :id, :user_name, :first_name, :last_name, :salary, :position, :created_at, :updated_at
json.url employee_url(employee, format: :json)
