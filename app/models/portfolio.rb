class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image


  scope :ruby_on_rails_items, -> {where(subtitle: 'Ruby on Rails')}
  scope :angular_items, -> {where(subtitle: 'Angular')}
end
