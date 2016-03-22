class Country < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  def self.posts
    super.order(:number)
  end

  def to_s
    name
  end

  def url_string
    name.gsub(" ", "_")
  end

  def create_post
    posts.create :number => next_post_number, :layout => Layout.default
  end

  def next_post_number
    posts.count
  end
end
