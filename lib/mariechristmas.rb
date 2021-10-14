require'nokogiri'
require 'open-uri'


##########    Methode recuperer un mail avec une URL   ################
def get_townhall_email(townhall_url)
  Nokogiri::HTML(URI.open("#{townhall_url}")).xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
  return email.text

end
end

########### Methode recuperer les Urls de chaque ville du Val d'Oise #########
def get_townhall_urls
  city = []
  town.xpath('//p/a').each do |node|
  city << node.text.downcase  #l'array city, est l'ensemble des villes du 95
  end
  array_url = city
  final = []
  array_url.each do |town|
  return array_url2 = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/#{town.gsub(" ", "-" )}.html"))
  end
end

def supermethod
town = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
city = []
town.xpath('//p/a').each do |node|
city << node.text.downcase
end
#l'array city, est l'ensemble des villes du 95

array_url = city
final = []
city.each do |town|
array_url2 = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/#{town.gsub(" ", "-" )}.html"))
array_url3 = array_url2.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
final << array_url3.text
end

hashfinal = Hash[city.zip(final)]

arrayfinal = []
arrayfinal << hashfinal
puts arrayfinal.inspect
end

supermethod
