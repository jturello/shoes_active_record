class Store < ActiveRecord::Base
  has_and_belongs_to_many :shoe_brands
end
