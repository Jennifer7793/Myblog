class AddPublishToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :publish, :integer, default: 0
  end
end
