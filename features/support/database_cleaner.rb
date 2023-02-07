# frozen_string_literal: true

require 'database_cleaner/active_record'

DatabaseCleaner[:active_record].strategy = :transaction

Around do |_scenario, block|
  DatabaseCleaner.cleaning(&block)
end
