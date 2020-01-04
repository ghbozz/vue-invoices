class Field < ApplicationRecord
  before_save :convert_quantity_to_integer

  belongs_to :invoice

  def convert_quantity_to_integer
    self[:quantity] = self[:quantity].to_i
  end
end
