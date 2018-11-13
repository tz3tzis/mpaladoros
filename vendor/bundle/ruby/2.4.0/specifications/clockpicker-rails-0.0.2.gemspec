# -*- encoding: utf-8 -*-
# stub: clockpicker-rails 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "clockpicker-rails".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dale Stevens".freeze]
  s.date = "2015-02-12"
  s.description = "A clock-style timepicker for Bootstrap (or jQuery). http://weareoutman.github.io/clockpicker/".freeze
  s.email = ["dale@twilightcoders.net".freeze]
  s.homepage = "https://github.com/twilightcoders/clockpicker-rails".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "A clock-style timepicker for Bootstrap (or jQuery). http://weareoutman.github.io/clockpicker/".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, [">= 10.0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, [">= 10.0"])
  end
end
