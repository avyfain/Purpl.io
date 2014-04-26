class AddProfessorIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :professor_id, :integer
  end
end
