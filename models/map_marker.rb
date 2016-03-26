class MapMarker < ActiveRecord::Base
  validates :latitude, :longitude, :timestamp, :presence => true

  def self.ordered
    order(:timestamp)
  end

  def self.coordinates
    ordered.map do |marker|
      [marker.longitude, marker.latitude]
    end
  end
end
