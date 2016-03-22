class Layout

  def self.as_hash
    {
      'Titel mit Bild' => 'title_with_pic',
      'Nur Bild' => 'pic',
      'Text links, Bild rechts' => 'text_left_pic_right',
      'Bild links, Text rechts' => 'pic_left_text_right',
      'Nur Text' => 'text',
    }
  end

  def self.default
    as_hash.values.first
  end
end
