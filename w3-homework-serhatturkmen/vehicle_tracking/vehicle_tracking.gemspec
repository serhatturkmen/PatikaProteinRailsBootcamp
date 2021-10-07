# frozen_string_literal: true

require_relative "lib/vehicle_tracking/version"

Gem::Specification.new do |spec|
  spec.name = "vehicle_tracking"
  spec.version = VehicleTracking::VERSION
  spec.authors = ["serhatturkmen"]
  spec.email = ["serhat_21_88@hotmail.com"]

  spec.summary = "Vehicle Tracking App"
  spec.description = "Bootcamp Homework Week3"
  spec.homepage = "https://rubygems.org"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

end
