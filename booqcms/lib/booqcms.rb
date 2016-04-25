Gem.loaded_specs['booqcms'].dependencies.each do |d|
 require d.name
end

require "booqcms/engine"
require "booqcms/configuration"
require 'redcarpet'

module Booqcms
end
