class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :by_position, -> { order(position: :asc)}
  scope :ruby_on_rails_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :angular_items, -> { where(subtitle: 'Angular') }

end
