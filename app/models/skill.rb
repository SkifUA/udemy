class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized

  scope :default_order, ->() { order(id: :asc) }
end
