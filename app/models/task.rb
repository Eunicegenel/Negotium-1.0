class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :due_date, presence: true

  belongs_to :user
end
