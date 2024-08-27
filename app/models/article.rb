class Article < ApplicationRecord
  # To access the concern(module) we need to include it
  # This will make class and instance level methods and variables accesible
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
