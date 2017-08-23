class Portfolio < ApplicationRecord
  has_many :tehnologies
  accepts_nested_attributes_for :tehnologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_items, -> {where(subtitle: 'Ruby on Rails')}
  scope :angular_items, -> {where(subtitle: 'Angular')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
