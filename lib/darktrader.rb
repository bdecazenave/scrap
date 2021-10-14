require 'rubygems'
require 'nokogiri'
require 'open-uri'

#cette methode vient récupérer le nom des cryptos
def key
 namekey = []
 data_key = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
data_key.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').each do |node|
	 namekey << node.text
	end
return namekey
end

#cette methode viennt récupérer les valeurs des cryptos
def value
  namevalue = []
  data_value = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  data_value.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div').each do |node|
    namevalue << node.text
  end
  return namevalue
end

def zip(namekey,namevalue)
  array = []
  h = Hash[namekey.zip(namevalue)]
    array << h
    puts array.inspect
end

#cette variable vient récupérer le nom et la valeur de la crypto
def execute
  namekey = key
  namevalue = value
  h = zip(namekey,namevalue)
end

execute
