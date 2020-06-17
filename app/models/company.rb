class Company < ApplicationRecord
  resourcify
  belongs_to :user , optional: true, foreign_key: true, inverse_of: :company
  validates :user_id, presence: true, uniqueness: true 
  validates :name, presence: true
  validates :nip, presence: true
  has_many :lessons
  has_many :clients
end
