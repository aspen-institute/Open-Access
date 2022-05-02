class HomeSection < ApplicationRecord
  has_many :page_references, dependent: :destroy

  accepts_nested_attributes_for :page_references
end
