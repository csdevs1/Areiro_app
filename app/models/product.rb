class Product < ActiveRecord::Base
    has_many :images, :dependent => :destroy
    belongs_to :subcategory
    accepts_nested_attributes_for :images, :reject_if => lambda { |t| t['image'].nil? }
end
