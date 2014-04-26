class AddReadMapToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :readmap, :string
  end
end
