#gem install hpricot
require 'rubygems'
require 'open-uri'
require 'pp'
require 'hpricot'
require 'uri'


class RawWebData
  
  def initialize
  end

  def getUseragent
    uaPool = UseragentPool.new
    return uaPool.getRandomUseragent
  end

  def getProxy
    pPool = ProxyPool.new
    return pPool.getRandomProxy
  end
  
  
  def getLastfmArtistPopularityUrl altnet_name
    url_encoded_string = URI::escape(altnet_name)
    url = "http://www.last.fm/music/" + url_encoded_string
    return url
  end

  def getLastfmAlbumPopularityUrl artist_name, album_name
    url_encoded_string_artist = URI::escape(artist_name)
    url_encoded_string_album = URI::escape(album_name)
    url = "http://www.last.fm/music/" + url_encoded_string_artist + "/" + url_encoded_string_album
    return url
  end

  # def getLastfmArtistPopularityUrl altnet_name
  #   url_encoded_string = URI::escape(altnet_name)
  #   url = "http://www.last.fm/music/" + url_encoded_string
  #   return url
  # end

  
  def getLastfmArtistPopularity altnet_name
    url = getLastfmArtistPopularityUrl(altnet_name)
    puts url
    html = open(url, "User-Agent" => getUseragent(), :proxy=>getProxy())
    begin    
      document = Hpricot(html)
      #ar = document.search("//div[@id='catalogueHead']");
      ar = document.search("//div[@id='catalogueHead']").search("//p[@class='stats']");      
      return ar
    rescue Exception => e
      puts "html grab error"
      return ""
    end           
  end

  def getLastfmAlbumPopularity artist_name, album_name
    url = getLastfmAlbumPopularityUrl(artist_name, album_name)
    puts url
    html = open(url, "User-Agent" => getUseragent(), :proxy=>getProxy())
    begin    
      document = Hpricot(html)
      #ar = document.search("//div[@id='catalogueHead']");
      ar = document.search("//div[@id='catalogueHead']").search("//p[@class='stats']");      
      return ar
    rescue Exception => e
      puts "html grab error"
      return ""
    end           
  end

  
  # throw timeout exception if proxy does not work
  # return empy if no similar artist find
  # return string if find
  def getYahooMusicData altnet_name
    url = getYahooMusicDataUrl(altnet_name)
    puts url
    html = open(url, "User-Agent" => getUseragent(), :proxy=>getProxy())
    begin    
      document = Hpricot(html)
      ar = document.search("//ul[@id='artistPgSimArtists']");
      return ar
    rescue Exception => e
      return ""
    end       
  end
 
  def getYahooMusicDataUrl altnet_name
    url_encoded_string = CGI::escape(altnet_name)
    url = "http://new.music.yahoo.com/" + url_encoded_string +"/"
    return url  
  end
  
  def getLastFmWebDataUrl altnet_name
    url_encoded_string = CGI::escape(altnet_name)
    url = "http://www.last.fm/music/" + url_encoded_string +"/+similar"
    return url
  end
        
  def getLastFmSimilarTrackDataUrl artist_name, album_name, track_name
    #http://www.last.fm/music/The+Rolling+Stones/_/Come+On/+similar
    url_encoded_string_artist = CGI::escape(artist_name)
    url_encoded_string_track = CGI::escape(track_name)
    url = "http://www.last.fm/music/" + url_encoded_string_artist +"/_/"+url_encoded_string_track+"/+similar"
    return url
  end

  def getLastFmSimilarTrackData artist_name, album_name, track_name
    url = getLastFmSimilarTrackDataUrl(artist_name, album_name, track_name);
    puts url
    #url = "http://www.google.com"
    html = open(url, "User-Agent" => getUseragent())#, :proxy=>getProxy())
    begin    
      document = Hpricot(html)
      ar = document.search("//div[@class='skyWrap']").search("//table[@class='candyStriped chart']");
      print ar
      return ar
    rescue Exception => e
      return ""
    end       
  end
               

  
  # have to do 2 pages
  def getLastFmWebData altnet_name
    #altnet_name = "Beyoncé"    
    url = getLastFmWebDataUrl(altnet_name)
    #url = "http://www.google.com"
    puts url
    #document = Hpricot(open ("http://www.last.fm/music/" + url_encoded_string +"/+similar", "User-Agent" => "great", :proxy=>"http://208.43.250.128:3128/"))
    document = Hpricot(open(url, "User-Agent" => getUseragent(), :proxy=>getProxy()))
    #document = Hpricot(open (url))
    ar = document.search("//ul[@class='artistsWithInfo']");
    #print ar
    if (ar.empty?)
      #puts "empty"
      return ar
    end
    
    #puts "ar:" + ar.length.to_s
    url = url + "?page=2"
    #puts url
    #document = Hpricot(open (url))
    document = Hpricot(open(url, "User-Agent" => getUseragent(), :proxy=>getProxy()))
    ar1 = document.search("//ul[@class='artistsWithInfo']");
    #puts "ar1:" + ar1.length.to_s
    ar = ar + ar1
    #puts "ar" + ar.length.to_s
       
     
    #if ar.empty
    #print ar
    return ar
  end # end of function


  def getMtvDataUrl altnet_name
    url_encoded_string = altnet_name.gsub("the ", "")
    url_encoded_string = url_encoded_string.gsub("The ", "")
    url_encoded_string = url_encoded_string.gsub(" ", "_")

    url_encoded_string = CGI::escape(url_encoded_string)
    #http://www.mtv.com/music/artist/clash/related_artists.jhtml?similarTo=true
    url = "http://www.mtv.com/music/artist/" + url_encoded_string +"/related_artists.jhtml?similarTo=true"
    return url  
  end

  def getMtvData altnet_name
    url_encoded_string = altnet_name.gsub("the ", "")
    url_encoded_string = url_encoded_string.gsub("The ", "")
    url_encoded_string = url_encoded_string.gsub(" ", "_")

    puts "http://www.mtv.com/music/artist/"+url_encoded_string + "/artist.jhtml"
    open("http://www.mtv.com/music/artist/"+url_encoded_string + "/artist.jhtml")
    
    url = getMtvDataUrl(altnet_name)
    puts url

    
    document = Hpricot(open(url, "User-Agent" => getUseragent(), :proxy=>getProxy()))
    
   # print document
    #br = document.search("//ol[@class='lst lst-photos lst-photos-three ']");
    ar = document.search("//ol[@class='lst lst-photos lst-photos-three ']");
       
    ar1 = document.search("//ol[@class='lst lst-photos lst-photos-three lst-photos-last ']");
    ar = ar + ar1
    
    #print ar
    return ar
  end
      
  def getEchonestUrl(mz_id, altnet_name)
    api_key = "U5HC4VU7NSELKNWKE"
    result_number = 40
    if (mz_id == nil or mz_id.empty?)
      url_encoded_string = CGI::escape(altnet_name)
      return "http://developer.echonest.com/api/v4/artist/similar?api_key=" + api_key + "&name=" + url_encoded_string + "&format=xml&bucket=id:musicbrainz&results="+result_number.to_s+"&start=0"
    end
    
    return "http://developer.echonest.com/api/v4/artist/similar?api_key=" + api_key + "&id=musicbrainz:artist:" + mz_id + "&format=xml&bucket=id:musicbrainz&results="+result_number.to_s+"&start=0"
  end
      
  def getEchonest(mz_id, altnet_name)
      url = getEchonestUrl(mz_id, altnet_name)
      puts url
      document = Hpricot(open(url, "User-Agent" => getUseragent(), :proxy=>getProxy()))
      #print document
      return document
  end

  def getEchonestArtistPopularUrl(mz_id, altnet_name)
    api_key = "U5HC4VU7NSELKNWKE"
    result_number = 40
    if (mz_id == nil or mz_id.empty?)
      url_encoded_string = URI::escape(altnet_name)
      return "http://developer.echonest.com/api/v4/artist/hotttnesss?api_key=" + api_key + "&name=" + url_encoded_string + "&format=xml"
    end
    
    return "http://developer.echonest.com/api/v4/artist/hotttnesss?api_key=" + api_key + "&id=musicbrainz:artist:" + mz_id + "&format=xml"
  end
  
  
  def getEchonestArtistPopularData(mz_id, altnet_name)
      url = getEchonestArtistPopularUrl(mz_id, altnet_name)
      puts url
      document = Hpricot(open(url, "User-Agent" => getUseragent(), :proxy=>getProxy()))
      #print document
      return document
  end
  
end
