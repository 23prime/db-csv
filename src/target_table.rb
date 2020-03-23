require 'active_record'
require_relative 'setup'

class TargetTable < ActiveRecord::Base
  self.table_name = Setup.instance.table_name
end
