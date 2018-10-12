
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
#  //h3[@class = "r"]/a[@class = "l"]
#doc.xpath('//h3[@class = "r"]/a[@class = "l"]').each do |node|
#    doc.xpath(//main//section//tbody[@class = "txt-primary"]/td).each do |node|
#      doc.xpath(//head/titre[@class = "txt-primary"]/td).each do |node|
        a = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
        puts a.text

end


def get_all_the_urls_of_val_doise_townhalls
      my_hash = Hash.new
      doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
      i = 0
      j = 0
      doc.xpath('//p/a').each do |node|

#         my_hash[i] = {name: "#{node.text}", value: "#{node['href']}"}
         my_hash[i]=[ville: "#{node.text}" ,url:"#{node['href']}"]
          i += 1
          j += 1
      end
      my_hash.each do |i|
        print my_hash[i]
      end
end
pp get_all_the_urls_of_val_doise_townhalls
puts ''
puts get_the_email_of_a_townhal_from_its_webpage
