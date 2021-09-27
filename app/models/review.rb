class Review < ApplicationRecord
  validates :title, :body, :name, presence: true
  belongs_to :user
end
