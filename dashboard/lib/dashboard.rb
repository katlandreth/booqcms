Gem.loaded_specs['dashboard'].dependencies.each do |d|
  if d.name == "fog"
    require 'fog/aws'
  else
    require d.name
  end
end

require 'devise'
require "dashboard/engine"
require "dashboard/configuration"
require 'redcarpet'



module Dashboard
end
