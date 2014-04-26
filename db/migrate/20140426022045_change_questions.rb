class ChangeQuestions < ActiveRecord::Migration
  def change
    add_column :courses, :readmap, :text
  end
end
