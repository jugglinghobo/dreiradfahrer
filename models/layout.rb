class Layout

  def self.as_hash
    {
      'Titel mit Bild' => 'title_with_pic',
      'Nur Bild' => 'pic',
      'Text oben, Bild unten' => 'text_top_pic_bottom',
      'Text links, Bild rechts' => 'text_left_pic_right'
    }
  end

  def self.default
    as_hash.values.first
  end
end
