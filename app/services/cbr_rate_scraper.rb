require 'openssl'
require 'open-uri'

class CbrRateScraper
  def self.get_rate
    doc = Nokogiri::HTML(open('https://cbr.ru/')).css('.content').css('.w_data_wrap')[0].text
    rate = doc.split('').last(7).join.sub(/,/, '.').to_f
  end
end