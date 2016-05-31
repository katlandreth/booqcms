Gem.loaded_specs['booqcms'].dependencies.each do |d|
  if d.name == "fog"
    require 'fog/aws'
  else
    require d.name
  end
end

require 'devise'
require "booqcms/engine"
require "booqcms/configuration"
require 'redcarpet'



module Booqcms
end
