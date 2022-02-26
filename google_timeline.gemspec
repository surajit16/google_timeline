# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_timeline/version'

Gem::Specification.new do |spec|
  spec.name          = "google_timeline"
  spec.version       = GoogleTimeline::VERSION
  spec.authors       = ["Surajit Khan"]
  spec.email         = ["surajit16@gmail.com"]

  spec.summary       = %q{Integrate Map-Timeline (Google)}
  spec.description   = %q{Integrate Map Timeline (Google)}
  spec.homepage      = "https://github.com/surajit16/google_timeline"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
#  if spec.respond_to?(:metadata)
#    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
#  else
#    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
#  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files	    +=  Dir['lib/*'] + Dir['lib/google_timeline/*'] + Dir['bin/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'polylines', '~> 0'
  spec.add_runtime_dependency 'nokogiri', '>= 1.6.7.2', '< 1.13.4.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.0'
end
