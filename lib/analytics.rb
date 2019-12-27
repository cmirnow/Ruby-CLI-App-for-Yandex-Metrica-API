# frozen_string_literal: true

require_relative 'yandex_metrika.rb'

class Analytics
  def self.query(dimension)
    YandexMetrika.inquiry(ENV['AUTH_TOKEN_METRIKA'], ENV['IDS_METRIKA'], dimension)
  end

  def self.query1(preset)
    YandexMetrika.inquiry1(ENV['AUTH_TOKEN_METRIKA'], ENV['IDS_METRIKA'], preset)
  end

end
