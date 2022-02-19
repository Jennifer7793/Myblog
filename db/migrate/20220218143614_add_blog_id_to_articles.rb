class AddBlogIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :blog, index: true
  end
end
