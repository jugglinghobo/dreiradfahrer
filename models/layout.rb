class Layout

  def self.as_hash
    {'Titel mit Untertitel' => 'title', 'Nur Bild' => 'picture', 'Text oben, Bild unten' => 'text_top_pic_bottom'}
  end

  def self.default
    as_hash.values.first
  end
end
