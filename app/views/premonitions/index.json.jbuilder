json.array!(@premonitions) do |premonition|
  json.extract! premonition, :id, :title, :date, :type, :type_description, :description, :location_user, :location_premonition, :premonition_come_true, :premonition_come_true_description, :someone_else, :own_conclusions, :more_premonitions, :tags, :status
  json.url premonition_url(premonition, format: :json)
end
