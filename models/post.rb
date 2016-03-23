class Post < ActiveRecord::Base
  belongs_to :country
  has_many :photos
  has_many :paragraphs
  accepts_nested_attributes_for :photos, :reject_if => :all_blank
  accepts_nested_attributes_for :paragraphs, :reject_if => :all_blank

  validates_presence_of :country, :number

  before_create :set_number

  def self.ordered
    order(:number)
  end

  def self.paragraphs
    super.order :rank
  end

  def self.photos
    super.order :rank
  end

  def self.update_multiple(posts_attributes)
    Post.transaction do
      posts_attributes.each do |post_id, post_attributes|
        post = Post.find post_id
        post.update_attributes post_attributes
      end
    end
  end

  def url_string
    "/countries##{country.url_string}/#{number}"
  end

  def title
    paragraphs.first
  end

  def content
    paragraphs.second
  end

  def picture
    photos.first.try(:picture)
  end

  def layout
    read_attribute(:layout) || Layout.default
  end

  def layout_s
    Layout.as_hash.key(layout)
  end

  def set_number
    @number = country.next_post_number
  end

end
