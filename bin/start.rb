# frozen_string_literal: true

require_relative '../lib/analytics.rb'
require 'dotenv/load'
require 'typhoeus'
require 'json'
require 'terminal-table'

puts ''
puts '******* YANDEX.METRIKA. ALL-ROUND WEB ANALYTICS *******'
puts ''

puts 'Today or Yesterday? choose between 1-2:'
date = if gets.strip == '1'
         'today'
       else
         'yesterday'
       end

puts 'First Web site or Second Web site? choose between 1-2:'
ids = if gets.strip == '1'
        ENV['IDS_METRIKA_1']
      else
        ENV['IDS_METRIKA_2']
      end

[
  ['ym:s:regionCountry', 'Country', 'Visitors by Countries'],
  ['ym:s:regionCity', 'City', 'Visitors by Cities'],
  ['ym:s:externalRefererPathLevel1', 'Referer', 'External Referers'],
  ['ym:s:browser', 'Browser', 'Browsers'],
  ['sources_search_phrases', 'Phrase', 'Today`s Search Phrases'],
  ['ym:s:searchEngine', 'Search Engine', 'Visits and Visitors Based on Search Engines']
].each do |args|
  Analytics.table(*args.push([date, ids]).flatten!)
end

Analytics.table_1('sources_summary', 'Title', 'Source', 'Today`s Sources Summary', date, ids)
