require 'hpricot'
class YahoomusicDataSourceHandler < DataSource
    def initialize
      @DataSourceType = "yahoomusic"  
      @ReDoAll = false
      @ReDoError = false
      @ReDo1 = false
      @ReDo2 = false
      @ReDo3 = false
      @ReDo4 = false 
      @ReDo5 = false       
    end

  def getSimilarArtistWebRawData artist
        rw = RawWebData.new
        
        begin
          
          retStr = rw.getYahooMusicData(artist.name)
          
          html = ""
          if (retStr.empty?)
            status = 2
            #html = ""
           else
             html = retStr
            status = 5
          end

          WebsourceYahoomusic.delete_all(:altnet_id => artist.id) 
          wlf = WebsourceYahoomusic.new
          wlf.altnet_id = artist.id
          wlf.html = html.to_s
          wlf.url = rw.getYahooMusicDataUrl(artist.name)
          wlf.save
          
          return status 
            
          
        rescue Exception => e
          puts e
          status = 4
          return status
        end 
    
  end
  
  
  def getSimilarArtistId artist
      
 
  end #end of function 

  def analyzeSimilarArtistRawData art
    document = Hpricot(art.websource_yahoomusic.html.to_s)
    sarts = document.search("li").search("a")
    
    
    #RelateMtv.delete_all(:altnet_id => art.id)
    
    icount = 0
    ifound = 0
    sarts.each do |sart|
      #puts sart
      regex = Regexp.new(/>(.*)<\/a>/)
      matchdata = regex.match(sart.to_s)
      
      icount = icount + 1
      
      if matchdata
        similar_artist_name = matchdata[1]         
        ifound = ifound + insertSimilarArtist(art.id, similar_artist_name, icount)
        #puts similar_artist_name           
      end
      
    end #end of iteration of artists 
    
    if (ifound > 0)
      return 1
    else
      return 6
    end
  end #end of function
  
end
