class AddKeysToSurveyResults < ActiveRecord::Migration
  def change
    add_column :survey_results, :student_id, :integer
    add_column :survey_results, :course_id, :integer
  end
end
