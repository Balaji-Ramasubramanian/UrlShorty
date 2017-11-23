# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "url_shorty/version"

Gem::Specification.new do |spec|
  spec.name          = "url_shorty"
  spec.version       = UrlShorty::VERSION
  spec.authors       = ["Balaji"]
  spec.email         = ["balaji030698@gmail.com"]

  spec.summary       = %q{This is a google url shortener tool for ruby users.}
  spec.description   = %q{By using this gem we can able to shorten a URL
                        and also able to expand the Short URLs.}
  spec.homepage      = "https://github.com/balaji12345/UrlShorty"
  spec.license       = "MIT"
  spec.files = ['lib/url_shorty/analytics.rb',
                'lib/url_shorty/utils.rb',
                'lib/url_shorty/version.rb']
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_runtime_dependency "json", "~> 2.0.2"
  spec.add_runtime_dependency "httparty", "~> 0.15.6"
end
