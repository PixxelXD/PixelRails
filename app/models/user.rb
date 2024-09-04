class User < ApplicationRecord
  validates :first_name, :last_name, :birth_date, :gender, :email, :phone_number, :subject, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
