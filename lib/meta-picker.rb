require 'Nokogiri'
require 'hashie'
require 'faraday'

class MetaPicker

  attr_reader :doc

  def initialize(url)
    self.doc =  Nokogiri::HTML(Faraday.new(:url => url).get.body)
  end

  def twitter_card
    hashify("twitter:")
  end

  def og_data
    hashify("og:")
  end

  def all_meta
    hashify("")
  end

  private

    attr_writer :doc

    def hashify(filter)
      output = Hashie::Mash.new
      (self.doc.xpath("//meta[starts-with(@property, '#{filter}')]") + self.doc.xpath("//meta[starts-with(@name, '#{filter}')]")).each do |i|
        if i['property']
          key = i['property'].to_s.gsub(filter, '').gsub(":", '_')
        elsif i['name']
          key = i['name'].to_s.gsub(filter, '').gsub(":", '_')
        end
        output.merge! key => i['content']
      end
      output
    end
end