class Blog < ApplicationRecord
  has_many :articles
  belongs_to :users
end
