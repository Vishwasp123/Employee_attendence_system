  class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :warehouse

    validate :within_geofence

    def within_geofence
      distance = Geocoder::Calculations.distance_between([latitude, longitude], [warehouse.latitude, warehouse.longitude])
      if distance > 0.05
        errors.add(:base, 'You must be within 500 meters of the warehouse to log attendance.')
      end
    end
  end
