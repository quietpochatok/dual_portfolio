require "net/http"
require "uri"
require "rexml/document"

module ParserSite
  extend self

  URL_SITE = 'http://www.cbr.ru/scripts/XML_daily.asp'

  def parsing_rate_value_from_cbr
    uri = URI.parse(URL_SITE)

    response = Net::HTTP.get_response(uri)

    doc = REXML::Document.new(response.body)

    rate_value = doc.get_elements('//Valute[@ID="R01235"]').map do |data_element|
      value = data_element.get_text('Value')
    end
  end
end
