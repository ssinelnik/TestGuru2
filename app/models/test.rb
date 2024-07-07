class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users_tests, dependent: :destroy
  has_many :users, through: :users_tests, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :show_tests_by_category, -> (category) { joins(:category).where(categories: {title: category}).order(id: :desc).pluck(:title) }
end
