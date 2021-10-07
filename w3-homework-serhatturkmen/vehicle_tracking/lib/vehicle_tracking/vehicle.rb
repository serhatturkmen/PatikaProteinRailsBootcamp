require 'json'

class Vehicle
  attr_accessor :plate, :model, :full_name

  def initialize(plate, model, full_name)
    @plate = plate
    @model = model
    @full_name = full_name
  end

  def to_s
    "#{full_name.upcase} - #{return_city(plate[0..1].to_i)} - #{model.upcase} - #{plate} "
  end

  private

  def return_city(plates_id)
    JSON.parse(File.read('plates.json'))[plates_id.to_s]
  end
end

