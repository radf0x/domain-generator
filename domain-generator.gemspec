# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'domain-generator'
  s.version     = '0.1.0'
  s.licenses    = 'MIT'
  s.summary     = 'Reduce boilerplate for a domain-driven design application'
  s.description = 'A gem that reduce boilerplates when creating new domain services'
  s.authors     = "radf0x"
  s.email       = 'x0fdar@gmail.com'
  s.files       = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
  s.add_development_dependency 'rails', '~> 3.2.0'
  s.homepage    = 'https://github.com/radf0x/domain-generator'
  s.metadata    = { 'source_code_uri' => 'https://github.com/radf0x/domain-generator' }
end
