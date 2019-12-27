# frozen_string_literal: true

require 'dotenv/load'
require 'typhoeus'
require 'json'

class YandexMetrika
  def self.inquiry(token, ids, dimension)
    response = Typhoeus::Request.get(
      'https://api-metrika.yandex.ru/stat/v1/data',
      params: {
        'ids' => ids,
        'metrics' => 'ym:s:visits',
        'dimensions' => dimension,
        'lang' => 'en',
        'date1' => '1daysAgo',
        'date2' => 'yesterday',
        'accuracy' => 'full'
      },
      headers: {
        Accept: 'application/x-yametrika+json',
        Authorization: 'OAuth' + token
      }
    )
    JSON.parse(response.body)
  end

  def self.inquiry1(token, ids, preset)
    response = Typhoeus::Request.get(
      'https://api-metrika.yandex.ru/stat/v1/data',
      params: {
        'ids' => ids,
        'preset' => preset,
        'date1' => '1daysAgo',
        'date2' => 'yesterday',
        'accuracy' => 'full'
      },
      headers: {
        Accept: 'application/x-yametrika+json',
        Authorization: 'OAuth' + token
      }
    )
    JSON.parse(response.body)
  end

end
