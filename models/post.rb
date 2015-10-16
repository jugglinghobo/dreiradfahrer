class Post < ActiveRecord::Base
  belongs_to :group
  has_many :pages

  def self.pages
    super.order :number
  end

  def create_page
    pages.create :number => next_page_number, :layout => Layout.default
  end

  def next_page_number
    pages.count
  end
end
