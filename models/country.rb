class Country < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  def self.pages
    super.order(:number)
  end

  def to_s
    name
  end

  def url_string
    name.gsub(" ", "_")
  end

  def create_page
    pages.create :number => next_page_number, :layout => Layout.default
  end

  def next_page_number
    pages.count
  end
end
