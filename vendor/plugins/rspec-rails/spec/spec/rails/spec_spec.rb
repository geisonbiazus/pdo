# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "script/spec file" do
  it "should run a spec" do
    dir = File.dirname(__FILE__)
    output = `#{RAILS_ROOT}/script/spec #{dir}/sample_spec.rb`
    unless $?.exitstatus == 0
      flunk "command 'script/spec spec/sample_spec' failed\n#{output}"
    end
  end
end
