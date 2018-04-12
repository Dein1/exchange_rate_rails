require 'openssl'
require 'open-uri'

class CbrRateScraper
  def self.usd_rate
    doc = Nokogiri::HTML(open('https://cbr.ru/')).css('.content').css('.weak')[0].text
    doc.gsub(/[^0-9]/, '').reverse.insert(4, '.').reverse.to_f
  end
end
