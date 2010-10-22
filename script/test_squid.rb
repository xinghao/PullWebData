#gem install hpricot
require 'rubygems'
require 'open-uri'
require 'pp'
require 'hpricot'


proxies = [
  "208.43.250.130",
  "174.37.219.226",
  "174.37.236.130",
  "69.72.194.174",
  "69.72.150.40",
  "69.72.152.20",
  "69.72.150.209",
  "174.37.114.140",
  "173.192.8.100",
  "67.228.156.40",
  "67.228.237.50",
  "67.228.223.60",
  "67.228.88.140"
  ]



url = "http://www.yahoo.com/"
proxies.each do |proxy|
  document = Hpricot(open(url, :proxy=>"http://" + proxy + ":3128/"))
  ar = document.search("//div[@id='y-masthead']");
  print proxy + ": "
  if (ar.empty?)
    puts "failed!"
  else
    puts "working"
  end
end
