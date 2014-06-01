class Premonition
  include Mongoid::Document
  field :title, type: String
  field :date, type: String
  field :type, type: String
  field :type_description, type: String
  field :description, type: String
  field :location_user, type: String
  field :location_user_text, type: String  
  field :location_premonition, type: String
  field :location_premonition_text, type: String
  field :premonition_come_true, type: String
  field :premonition_come_true_description, type: String
  field :someone_else, type: String
  field :own_conclusions, type: String
  field :more_premonitions, type: String
  field :time_more_premonitions, type: String  
  field :tags, type: Array
  field :status, type: Integer

  validates_presence_of :title, :message => "Summarize is mandatory"
  validates_presence_of :description, :message => "Description is mandatory"
  validates_presence_of :date, :message => "Date date is mandatory"
end
