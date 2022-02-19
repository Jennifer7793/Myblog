class Blog < ApplicationRecord
  belongs_to :users
  has_many :articles
end
