class Answer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :picture, presence: true
  has_many :questions, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
