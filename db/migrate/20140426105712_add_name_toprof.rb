class AddNameToprof < ActiveRecord::Migration
  def change
    add_column :professors, :name, :string
  end
end
