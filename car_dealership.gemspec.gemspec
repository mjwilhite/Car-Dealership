Gem::Specification.new do |s|
  s.name         = "car_dealership"
  s.version      = "1.0.0"
  s.author       = "Mattie Jo Wilhite"
  s.email        = "mjwilhite1s@gmail.com"
  s.homepage     = "none"
  s.summary      = "A random text-based car dealership program"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'car_dealership' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end