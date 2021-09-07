class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :name, presence: true
  belongs_to :user
end
