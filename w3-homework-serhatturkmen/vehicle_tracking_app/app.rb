# frozen_string_literal: true

require 'vehicle_tracking'
vehicle_tracking_module = VehicleTracking::Vehicles.new

if ARGV[0].nil?
  vehicle_tracking_module.new_vehicle
elsif ARGV[0] == '-s'
  puts vehicle_tracking_module.find_vehicle(ARGV[1])
end
