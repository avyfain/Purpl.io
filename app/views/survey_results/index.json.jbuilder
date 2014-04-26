json.array!(@survey_results) do |survey_result|
  json.extract! survey_result, :id, :classtime, :homework, :midterm, :workload, :material, :pace, :passion, :other
  json.url survey_result_url(survey_result, format: :json)
end
