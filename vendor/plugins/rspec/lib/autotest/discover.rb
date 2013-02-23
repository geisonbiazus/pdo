# -*- encoding : utf-8 -*-
Autotest.add_discovery do
  "rspec" if File.directory?('spec') && ENV['RSPEC']
end
