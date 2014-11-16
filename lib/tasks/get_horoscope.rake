namespace :horoscope do
  desc "Get horoscope"
  task :get => :environment do
    require 'nokogiri'
    require 'open-uri'

    dates_to_parse = UserHoroscope.all.empty? ? [DateTime.yesterday, now = DateTime.now, tomorrow = DateTime.tomorrow] : [tomorrow = DateTime.tomorrow]

    dates_to_parse.each do |date|
      horroscope_text = []
      horoscope = UserHoroscope.new
      horoscope[:date] = Date.new(date.year, date.month, date.day)

      uri = "http://www.findyourfate.com/rss/horoscope-astrology-feed.asp?mode=view&todate=#{Date.new(date.year, date.month, date.day).strftime("%m/%d/%Y")}"
      @doc = Nokogiri::XML(open(uri))
      @doc.xpath('///item').map do |i|
        horroscope_text << i.xpath('description').inner_text
      end
      horroscope_text.shift
      horroscope_text.pop

      UserHoroscope::SIGNS.each_with_index do |value, index|
        horoscope[value.to_sym] = horroscope_text[index]
      end
      horoscope.save
    end

  end
end
