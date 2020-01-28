class Country < ApplicationRecord
	has_many :states, dependent: :destroy
	has_many :cities, through: :states
	has_many :users, dependent: :nullify
	validates :name,  presence: true, uniqueness: { case_sensitive: false }
end
