# -*- encoding : utf-8 -*-
class Thing < ActiveRecord::Base
  validates_presence_of :name
end
