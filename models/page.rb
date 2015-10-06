class Page < ActiveRecord::Base
  has_many :photos
  has_many :paragraphs
  accepts_nested_attributes_for :photos, :reject_if => :all_blank
  accepts_nested_attributes_for :paragraphs, :reject_if => :all_blank

  def title
    "DAN"
  end

  def body
    "DANI"
  end


end
