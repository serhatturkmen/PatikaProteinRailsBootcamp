class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  scope :availables, -> { where(visible: true) }
end
