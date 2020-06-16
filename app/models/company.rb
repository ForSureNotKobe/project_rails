class Company < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true 
  validates :name, presence: true
  validates :nip, presence: true
end
