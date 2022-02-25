class Article < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :blog
  enum publish: { yes: 0, no: 1 }
  scope :published, -> { where(publish: 'yes') }
end
