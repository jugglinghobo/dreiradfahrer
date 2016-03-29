class MapMarker < ActiveRecord::Base
  validates :latitude, :longitude, :timestamp, :presence => true

  validates_uniqueness_of :latitude, :scope => :longitude, :message => "Can not create multiple markers at the same place"

  def self.ordered
    order(:timestamp)
  end

  def self.coordinates
    ordered.map do |marker|
      [marker.longitude, marker.latitude]
    end
  end
end
