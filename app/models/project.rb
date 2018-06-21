class Project < ApplicationRecord
  has_one :document
  attr_accessor :document_data
end
