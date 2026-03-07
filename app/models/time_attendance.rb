class TimeAttendance < ApplicationRecord
  belongs_to :employee

  validates :work_date, presence: true
  validates :check_in_at, presence: true
  validates :check_out_at, presence: true

  validate :check_out_must_be_after_check_in

  before_validation :calculate_overtime_hours

  private

  def check_out_must_be_after_check_in
    return if check_in_at.blank? || check_out_at.blank?
    return if check_out_at > check_in_at

    errors.add(:check_out_at, "must be after check in time")
  end

  def calculate_overtime_hours
    return if check_in_at.blank? || check_out_at.blank?
    return unless check_out_at > check_in_at

    worked_hours = (check_out_at - check_in_at) / 1.hour
    self.overtime_hours = [worked_hours - 8, 0].max.round(2)
  end
end
