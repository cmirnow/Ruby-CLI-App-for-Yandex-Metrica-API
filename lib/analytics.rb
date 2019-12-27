# frozen_string_literal: true

require_relative 'yandex_metrika.rb'

class Analytics
  def self.query(v)
    YandexMetrika.dimension_or_preset?(ENV['AUTH_TOKEN_METRIKA'], ENV['IDS_METRIKA'], v)
  end
end
