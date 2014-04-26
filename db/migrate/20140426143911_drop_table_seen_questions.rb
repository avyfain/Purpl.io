class DropTableSeenQuestions < ActiveRecord::Migration
  def change
  	drop_table :seen_questions
  end
end
