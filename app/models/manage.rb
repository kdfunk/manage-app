class Manage < ApplicationRecord
  has_many :tasks
  belongs_to :user
end
