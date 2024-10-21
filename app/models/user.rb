# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

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

  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

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
