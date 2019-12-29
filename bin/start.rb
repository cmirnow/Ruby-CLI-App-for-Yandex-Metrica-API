# frozen_string_literal: true

require_relative '../lib/analytics.rb'

puts ''
puts 'YANDEX.METRIKA. ALL-ROUND WEB ANALYTICS'
puts ''
puts '*********** TOP 10 Visitors by Countries ***********'
puts ''

Analytics.query('ym:s:regionCountry')['data'].first(13).each do |i|
  next unless i['dimensions'][0]['name'] != 'Russia' &&
              i['dimensions'][0]['name'] != 'Ukraine' &&
              i['dimensions'][0]['name'] != 'Belarus'

  # if i['dimensions'][0]['name'] == 'United States'
  puts i['dimensions'][0]['name']
  puts i['metrics'][0].to_i
end

puts ''
puts '*********** TOP 10 Visitors by Cities ***********'
puts ''

Analytics.query('ym:s:regionCity')['data'].first(10).each do |i|
  puts i['dimensions'][0]['name']
  puts i['metrics'][0].to_i
end

puts ''
puts '*********** External Referers ***********'
puts ''

Analytics.query('ym:s:externalRefererPathLevel1')['data'].first(10).each do |i|
  puts i['dimensions'][0]['name']
  puts i['metrics'][0].to_i
end

puts ''
puts '*********** Browsers ***********'
puts ''

Analytics.query('ym:s:browser')['data'].each do |i|
  puts i['dimensions'][0]['name']
  puts i['metrics'][0].to_i
end

puts ''
puts '*********** Yesterday Sources Summary ***********'
puts ''

Analytics.query('sources_summary')['data'].each do |i|
  puts i['dimensions'][0]['name']
  puts i['dimensions'][1]['name']
  puts i['metrics'][0].to_i
end

puts ''
puts '*********** Yesterday Search Phrases ***********'
puts ''

Analytics.query('sources_search_phrases')['data'].each do |i|
  puts i['dimensions'][0]['name']
  puts i['metrics'][0].to_i
end

puts ''
puts '*********** Visits and Visitors Based on Search Engines ***********'
puts ''

Analytics.query('ym:s:searchEngine')['data'].each do |i|
  puts i['dimensions'][0]['name']
  puts i['metrics'][0].to_i
end
