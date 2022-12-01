require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

lib = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Dir.glob('lib/**/*.rb').each do |file|
  require file.gsub(/\Alib\//, '')
end