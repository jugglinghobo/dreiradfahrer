class Post < ActiveRecord::Base
  has_many :photos
  has_many :paragraphs

  accepts_nested_attributes_for :photos
end
