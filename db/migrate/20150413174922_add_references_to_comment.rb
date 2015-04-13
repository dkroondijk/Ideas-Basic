class AddReferencesToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true, foreign_key: true
    add_reference :comments, :idea, index: true, foreign_key: true
  end
end
