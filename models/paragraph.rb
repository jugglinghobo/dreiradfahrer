class Paragraph < ActiveRecord::Base
  belongs_to :post

  def title
    content.split("\n").first.strip
  end

  def to_s
    content
  end
end
