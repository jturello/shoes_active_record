class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :brand, :presence => true
  before_save :capitalize

  private
  def capitalize
    self.brand = brand.titleize
  end
end
