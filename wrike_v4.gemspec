Gem::Specification.new do |s|
  s.name = 'wrike_v4'
  s.version = '0.0.1'
  s.date = '2020-01-06'
  s.summary = "Wrike API V4 Client"
  s.description = "Wrike API V4 Client for Ruby."
  s.authors = ["Noah Brandyberry"]
  s.email = 'noahbrandyberry@gmail.com'

  s.homepage = 'https://github.com/noahbrandyberry/wrike-v4-ruby'
  s.license = 'MIT'
  s.extra_rdoc_files  = ['README.md', 'LICENSE']

  s.files = `git ls-files`.split("\n")

  s.add_runtime_dependency('faraday', '~> 1.3.0')
  s.add_runtime_dependency('faraday_middleware', '~> 1.0')
end