class User < ApplicationRecord
	belongs_to :country
	belongs_to :state
	belongs_to :city
	has_many :posts, dependent: :destroy
	has_many :comments
	has_many :my_posts_comments, through: :posts, source: :comments
	has_many :user_subjects
	has_many :subjects, through: :user_subjects
	has_and_belongs_to_many :technologies
	validates :name, length: { minimum: 2 }  
	validates :contact_number, length: { in: 10..12 }
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :aadhar_number, length: { is:12 }
	validates :terms_condition, acceptance: true
end
