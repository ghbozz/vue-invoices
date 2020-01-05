class Entity < ApplicationRecord
  has_many :invoices

  validates :name, presence: true
end
