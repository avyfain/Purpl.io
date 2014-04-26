class AddUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :question
      t.belongs_to :student
    end
  end
end
