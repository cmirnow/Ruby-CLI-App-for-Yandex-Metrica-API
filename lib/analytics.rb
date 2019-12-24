# frozen_string_literal: true

require_relative 'yandex_metrika.rb'

class Analytics
  def self.query(dimension)
    YandexMetrika.inquiry(ENV['AUTH_TOKEN_METRIKA'], ENV['IDS_METRIKA'], dimension)
  end
end
