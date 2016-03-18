class Page < ActiveRecord::Base
  belongs_to :country
  has_many :photos
  has_many :paragraphs
  accepts_nested_attributes_for :photos, :reject_if => :all_blank
  accepts_nested_attributes_for :paragraphs, :reject_if => :all_blank

  validates_presence_of :country, :number

  before_create :set_number

  def self.paragraphs
    super.order :rank
  end

  def self.photos
    super.order :rank
  end

  def title
    paragraphs.first
  end

  def title_image
    photos.first
  end

  def layout
    read_attribute(:layout) || Layout.default
  end

  def layout_s
    Layout.as_hash.key(layout)
  end

  def set_number
    @number = country.next_page_number
  end
end
