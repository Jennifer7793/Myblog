class Article < ApplicationRecord
  belongs_to :blog
  enum publish: { yes: 0, no: 1 }
end
