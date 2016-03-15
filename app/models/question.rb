class Question < ApplicationRecord
  belongs_to :answer
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
end
