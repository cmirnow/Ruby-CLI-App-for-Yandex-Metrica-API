# frozen_string_literal: true

class Analytics
  def self.table_1(x, th1, title, date, ids)
    rows = []
    query(x, date, ids)['data'].each do |i|
      rows << [i['dimensions'][0]['name'].split(//).last(100).join, i['metrics'][0].to_i]
    end
    puts Terminal::Table.new title: title, headings: [th1, 'Number'], rows: rows
    puts ''
  end

  def self.table_2(x, th1, th2, title, date, ids)
    rows = []
    query(x, date, ids)['data'].each do |i|
      rows << [i['dimensions'][0]['name'], i['dimensions'][1]['name'], i['metrics'][0].to_i]
    end
    puts Terminal::Table.new title: title, headings: [th1, th2, 'Number'], rows: rows
    puts ''
  end

  def self.table_one(date, ids)
    [
      ['ym:s:regionCountry', 'Country', 'Visitors by Countries'],
      ['ym:s:regionCity', 'City', 'Visitors by Cities'],
      ['ym:s:externalRefererPathLevel1', 'Referer', 'External Referers'],
      ['ym:s:browser', 'Browser', 'Browsers'],
      ['sources_search_phrases', 'Phrase', 'Search Phrases'],
      ['ym:s:searchEngine', 'Search Engine', 'Visits and Visitors Based on Search Engines']
    ].each do |args|
      table_1(*args.push([date, ids]).flatten!)
    end
  end

  def self.table_two(date, ids)
    table_2('sources_summary', 'Title', 'Source', 'Sources Summary', date, ids)
  end

  def self.query(v, date, ids)
    YandexMetrika.dimension_or_preset?(ENV['AUTH_TOKEN_METRIKA'], ids, v, date)
  end
end
