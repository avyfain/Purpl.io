class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.string :classtime
      t.string :homework
      t.string :midterm
      t.string :workload
      t.string :material
      t.string :pace
      t.string :passion
      t.text :other

      t.timestamps
    end
  end
end
