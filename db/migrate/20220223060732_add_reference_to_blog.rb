class AddReferenceToBlog < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogs, :user, index: true
  end
end
