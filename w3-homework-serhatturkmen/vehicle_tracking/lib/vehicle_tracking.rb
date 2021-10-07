# frozen_string_literal: true

require_relative 'vehicle_tracking/version'
require 'vehicle_tracking/vehicle'
require 'vehicle_tracking/app_errors'
require 'yaml'
require 'json'

module VehicleTracking
  class Vehicles

    def initialize
      load_data
    end

    def print_vehicles
      load_data
      puts @items
    end

    def new_vehicle
      puts 'Plaka :'
      plate = gets.chomp
      finded_record?(plate)
      plate_city_validation(plate)

      puts 'Model :'
      model = gets.chomp
      model_has_many?(model)

      puts 'Ad/soyad :'
      full_name = gets.chomp

      @items << Vehicle.new(plate, model, full_name).to_s
      save_data
      puts "#{plate} vehicle was added."
    end

    def find_vehicle(search_text)
      result = load_data.select { |item| item.split('-').last.strip.eql?(search_text) }.first
      result ? result : "#{search_text} plakali arac sistemde yok."
    end

    private

    def finded_record?(plate)
      begin
        unless @items.select { |item| item.include?(plate) }.count.zero?
          raise AppErrors::PlateHasManyError.new
        end
      rescue AppErrors::PlateHasManyError => e
        puts "#{plate} #{e.message}"
        exit
      end
    end

    def plate_city_validation(plate)
      begin
        unless plate[0..1].to_i.between?(1, 81)
          raise AppErrors::PlateFormatError.new
        end
      rescue AppErrors::PlateFormatError => e
        puts e.message
        exit
      end
    end

    def model_has_many?(model)
      begin
        if JSON.parse(File.read('models.json')).select { |item| item['name'] == model.upcase }.count.zero?
          raise AppErrors::ModelNotFoundError.new
        end
      rescue AppErrors::ModelNotFoundError => e
        puts e.message
        exit
      end
    end

    def load_data
      if File.exist?('vehicles_data.yml')
        @items = YAML.load(File.read('vehicles_data.yml'))
      else
        @items = Array.new
      end
    end

    def save_data
      File.open('vehicles_data.yml', 'w') { |file| file.write(@items.to_yaml) }
    end

  end

end
