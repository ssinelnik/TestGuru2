# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy

  has_many :users, through: :users_tests, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: I18n.t('custom_message') }

  validates :level, numericality: { only_integer: true }
  validates :passing_time, presence: true

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }

  scope :show_tests_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(id: :desc)
  }

  def self.show_tests_by_category_array(category)
    show_tests_by_category(category).pluck(:title)
  end
end
