class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  # TODO update selution by use topic
  before_validation :default_topic

  validates_presence_of :title, :body

  belongs_to :topic
  has_many :comment, dependent: :destroy

  def default_topic
    self.topic ||= Topic.first
  end
end
