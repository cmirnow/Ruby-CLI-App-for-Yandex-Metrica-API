# frozen_string_literal: true

require_relative 'yandex_metrika.rb'

class Analytics
  def self.table(x, th1, title)
    rows = []
    query(x)['data'].each do |i|
      rows << [i['dimensions'][0]['name'], i['metrics'][0].to_i]
    end
    puts Terminal::Table.new title: title, headings: [th1, 'Number'], rows: rows
    puts ''
  end

  def self.table_1(x, th1, th2, title)
    rows = []
    query(x)['data'].each do |i|
      rows << [i['dimensions'][0]['name'], i['dimensions'][1]['name'], i['metrics'][0].to_i]
    end
    puts Terminal::Table.new title: title, headings: [th1, th2, 'Number'], rows: rows
    puts ''
  end

  def self.query(v)
    YandexMetrika.dimension_or_preset?(ENV['AUTH_TOKEN_METRIKA'], ENV['IDS_METRIKA'], v)
  end
end
