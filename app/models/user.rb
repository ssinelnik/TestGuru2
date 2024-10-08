# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages,
           dependent: :destroy

  has_many :tests, 
           through: :test_passages

  has_many :author_tests, class_name: 'Test', 
           foreign_key: :author_id, 
           dependent: :destroy,
           inverse_of: :author

  validates :name, :email, presence: true

  def show_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
