class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true
  self.per_page = 1

  scope :recent, -> { order(created_at: :desc) }
end
