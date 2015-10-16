class Paragraph < ActiveRecord::Base
  belongs_to :page

  def to_s
    content
  end
end
