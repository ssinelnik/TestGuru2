# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages,
           dependent: :destroy

  has_many :tests,
           through: :test_passages

  has_many :author_tests,
           class_name: 'Test',
           foreign_key: :author_id,
           dependent: :destroy,
           inverse_of: :author

  before_save :email_downcase

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, if: proc { |user| user.password_digest.blank? }
  validates :password, confirmation: true

  has_secure_password

  def show_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def email_downcase
    self.email = email.downcase if email.present?
  end
end
