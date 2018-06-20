class Project < ApplicationRecord
  has_many :documents
  attr_accessor :document_data
end
