class Task < ApplicationRecord
  belongs_to :manage

  validates :status, inclusion: { in: ['incomplete', 'ongoing', 'complete'] }

  STATUS_OPTIONS = [
    ['Incomplete', 'incomplete'],
    ['Ongoing', 'ongoing'],
    ['Complete', 'complete']
  ]

end
