class Entity < ApplicationRecord
  belongs_to :user
  has_many :invoices

  validates :name, presence: true
end
