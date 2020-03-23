require 'csv'
require 'dotenv/load'
require 'logger'
require 'singleton'

class InvalidArgumentsError < RuntimeError
end

class Setup
  attr_reader :logger, :table_name, :csv_file, :is_sync
  include Singleton

  def initialize
    @logger = Logger.new(STDOUT)
    @is_sync = false

    get_args
    @csv_file = "csv/#{@table_name}.csv"

    @logger.debug("Table Name => #{@table_name}")
    @logger.debug("CSV File   => #{@csv_file}")
    @logger.debug("Is sync    => #{@is_sync}")
  end

  def get_args
    case ARGV.size
    when 1
      @table_name = ARGV[0]
    when 2
      unless ARGV.include?('--sync')
        raise InvalidArgumentsError, 'Error: Invalid arguments.'
      end

      @table_name = File.basename(ARGV[(ARGV.find_index('--sync') + 1) % 2], '.csv')
      @is_sync = true
    else
      raise InvalidArgumentsError, 'Error: Invalid number of arguments.'
    end
  end
end
