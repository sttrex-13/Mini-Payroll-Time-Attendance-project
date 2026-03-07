class CreateTimeAttendances < ActiveRecord::Migration[8.1]
  def change
    create_table :time_attendances do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :work_date
      t.datetime :check_in_at
      t.datetime :check_out_at
      t.decimal :overtime_hours

      t.timestamps
    end
  end
end
