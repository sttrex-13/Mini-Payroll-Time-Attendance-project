class Employee < ApplicationRecord
  has_many :time_attendances

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :salary, presence: true
  validates :position, presence: true
end
