require_relative 'lib/school_library/version'

Gem::Specification.new do |spec|
  spec.name = 'school_library'
  spec.version = SchoolLibrary::VERSION
  spec.authors = ['David Vera Castillo']
  spec.email = ['indigodavid@gmail.com']

  spec.summary = 'Ruby Template'
  spec.description = 'Description of new Ruby repository'
  spec.homepage = 'https://github.com/indigodavid/school_library.git'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/indigodavid/school_library.git'
  spec.metadata['changelog_uri'] = 'https://github.com/indigodavid/school_library/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end