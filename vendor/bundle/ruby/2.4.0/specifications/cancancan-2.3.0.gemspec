# -*- encoding: utf-8 -*-
# stub: cancancan 2.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cancancan".freeze
  s.version = "2.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alessandro Rodi (Renuo AG)".freeze, "Bryan Rite".freeze, "Ryan Bates".freeze, "Richard Wilson".freeze]
  s.date = "2018-09-16"
  s.description = "Simple authorization solution for Rails. All permissions are stored in a single location.".freeze
  s.email = "alessandro.rodi@renuo.ch".freeze
  s.homepage = "https://github.com/CanCanCommunity/cancancan".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Simple authorization solution for Rails.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.1.1", "~> 10.1"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.2.0", "~> 3.2"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 2.0.0", "~> 2.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_dependency(%q<rake>.freeze, [">= 10.1.1", "~> 10.1"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.2.0", "~> 3.2"])
      s.add_dependency(%q<appraisal>.freeze, [">= 2.0.0", "~> 2.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
    s.add_dependency(%q<rake>.freeze, [">= 10.1.1", "~> 10.1"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.2.0", "~> 3.2"])
    s.add_dependency(%q<appraisal>.freeze, [">= 2.0.0", "~> 2.0"])
  end
end
