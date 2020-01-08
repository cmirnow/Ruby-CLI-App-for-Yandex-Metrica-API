# frozen_string_literal: true

require_relative 'yandex_metrika.rb'

class Analytics
  def self.table(x, th1, title, date, ids)
    rows = []
    query(x, date, ids)['data'].each do |i|
      rows << [i['dimensions'][0]['name'], i['metrics'][0].to_i]
    end
    puts Terminal::Table.new title: title, headings: [th1, 'Number'], rows: rows
    puts ''
  end

  def self.table_1(x, th1, th2, title, date, ids)
    rows = []
    query(x, date, ids)['data'].each do |i|
      rows << [i['dimensions'][0]['name'], i['dimensions'][1]['name'], i['metrics'][0].to_i]
    end
    puts Terminal::Table.new title: title, headings: [th1, th2, 'Number'], rows: rows
    puts ''
  end

  def self.query(v, date, ids)
    YandexMetrika.dimension_or_preset?(ENV['AUTH_TOKEN_METRIKA'], ids, v, date)
  end
end
