class AddLockToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :last_locked_on, :datetime
  end
end
