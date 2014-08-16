# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "shell2html"
  spec.version       = File.read(File.expand_path('../CHANGELOG.md', __FILE__))[/([0-9]+\.[0-9]+\.[0-9]+)/]
  spec.authors       = ["mose"]
  spec.email         = ["mose@mose.com"]
  spec.summary       = %q{A ruby lib for transforming bash colors into html.}
  spec.description   = %q{A ruby lib for transforming bash colors into html. Parses escape chars an output spans.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
