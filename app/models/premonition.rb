class Premonition
  include Mongoid::Document
  field :title, type: String
  field :date, type: String
  field :type, type: String
  field :type_description, type: String
  field :description, type: String
  field :location_user, type: String
  field :location_premonition, type: String
  field :premonition_come_true, type: String
  field :premonition_come_true_description, type: String
  field :someone_else, type: String
  field :own_conclusions, type: String
  field :more_premonitions, type: String
  field :tags, type: String
  field :status, type: Integer
end
