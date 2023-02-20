class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :featured_image
  validates :name, uniqueness: { scope: :user_id, message: "There is already a project with that name" }
end
