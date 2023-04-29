# frozen_string_literal: true

require 'dotenv/load'
require 'typhoeus'
require 'json'
require 'terminal-table'
require 'tty-prompt'
require 'date'
require_relative '../lib/analytics'
require_relative '../lib/yandex_metrika'

puts ''
puts '******* YANDEX.METRIKA. ALL-ROUND WEB ANALYTICS *******'
puts ''

date = YandexMetrika.date
ids = YandexMetrika.select_ids

Analytics.table_one(date, ids)
Analytics.table_two(date, ids)
