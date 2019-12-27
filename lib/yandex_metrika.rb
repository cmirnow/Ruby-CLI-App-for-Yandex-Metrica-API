# frozen_string_literal: true

require 'dotenv/load'
require 'typhoeus'
require 'json'

class YandexMetrika
  def self.dimension_or_preset?(token, ids, v)
    params = if v.include? 'sources'
               {
                 'ids' => ids,
                 'preset' => v,
                 'date1' => '1daysAgo',
                 'date2' => 'yesterday',
                 'accuracy' => 'full'
               }
             else
               {
                 'ids' => ids,
                 'metrics' => 'ym:s:visits',
                 'dimensions' => v,
                 'lang' => 'en',
                 'date1' => '1daysAgo',
                 'date2' => 'yesterday',
                 'accuracy' => 'full'
               }
               end
    inquiry(token, ids, params)
    end

  def self.inquiry(token, _ids, params)
    response = Typhoeus::Request.get(
      'https://api-metrika.yandex.ru/stat/v1/data',
      params: params,
      headers: {
        Accept: 'application/x-yametrika+json',
        Authorization: 'OAuth' + token
      }
    )
    JSON.parse(response.body)
  end
end
