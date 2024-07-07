class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order(title: :asc) }

  validate :title, presence: true, uniqueness: true
end
