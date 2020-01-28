class State < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :users, dependent: :nullify
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
end
