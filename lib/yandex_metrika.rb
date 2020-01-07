# frozen_string_literal: true

class YandexMetrika
  def self.dimension_or_preset?(token, ids, v)
    params = if v.include? 'sources'
               {
                 'ids' => ids,
                 'preset' => v,
                 'date1' => 'today',
                 'date2' => 'today',
                 'accuracy' => 'full'
               }
             elsif v.include? 'searchEngine'
               {
                 'ids' => ids,
                 'metrics' => 'ym:s:visits,ym:s:users',
                 'dimensions' => v,
                 # 'lang' => 'en',
                 'date1' => 'today',
                 'date2' => 'today',
                 'filters' => "ym:s:trafficSource=='organic'",
                 'accuracy' => 'full'
               }
             else
               {
                 'ids' => ids,
                 'metrics' => 'ym:s:visits',
                 'dimensions' => v,
                 'lang' => 'en',
                 'date1' => 'today',
                 'date2' => 'today',
                 'accuracy' => 'full'
               }
               end
    inquiry(token, params)
    end

  def self.inquiry(token, params)
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
