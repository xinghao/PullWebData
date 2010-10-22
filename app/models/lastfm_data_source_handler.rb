require 'hpricot'
class LastfmDataSourceHandler < DataSource
    def initialize
      @DataSourceType = "lastfm"  
      @ReDoAll = false
      @ReDoError = false
      @ReDo1 = false
      @ReDo2 = false
      @ReDo3 = false
      @ReDo4 = true 
      @ReDo5 = false 
      @ReDo = [0,0,0,0,0,0,0]      
    end

  
  def getSimilarArtistWebRawData artist
        rw = RawWebData.new
        
        begin
          
          retStr = rw.getLastFmWebData(artist.name)
          
          html = ""
          if (retStr.empty?)
            status = 2
           else
             html = retStr
            status = 5
          end

          #WebsourceLastfm.delete_all(:altnet_id => artist.id)
          #artist.websource_lastfm.remove 
          wlf = WebsourceLastfm.new
          wlf.altnet_id = artist.id
          wlf.html = html.to_s
          wlf.url = rw.getLastFmWebDataUrl(artist.name)
          #wlf.url = ""
          wlf.save
          
          return status 
            
          
        rescue Exception => e
          puts e
          status = 4
          return status
        end 
    
  end
  
  def getPopularArtistWebRawDataImp artist
        rw = RawWebData.new
        
        begin
          
          retStr = rw.getLastfmArtistPopularity(artist.name)
          
          html = ""
          if (retStr.empty?)
            status = 2
           else
             html = retStr
            status = 5
          end

          #WebsourceLastfm.delete_all(:altnet_id => artist.id)
          #artist.websource_lastfm.remove 
          wlf = WebsourceArtistPopularLastfm.new
          wlf.altnet_id = artist.id
          wlf.html = html.to_s
          wlf.url = rw.getLastfmArtistPopularityUrl(artist.name)
          #wlf.url = ""
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
    document = Hpricot(art.websource_lastfm.html.to_s)
    sarts = document.search("li").search("a").search("strong")
    
    
    #RelateMtv.delete_all(:altnet_id => art.id)
    
    icount = 0
    ifound = 0
    sarts.each do |sart|
      #puts sart
      regex = Regexp.new(/<strong>(.*)<\/strong>/)
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


  def analyzePopularArtistRawData art
    document = Hpricot(art.websource_artist_popular_lastfm.html.to_s)
    sarts = document.search("p");
    
    #puts sarts
    #RelateMtv.delete_all(:altnet_id => art.id)
    regex = Regexp.new(/\((.*) listeners\)/)
    matchdata = regex.match(sarts.to_s)
    
    
    if (matchdata != nil)      
      insertArtistPopularity(art.id,matchdata[1].gsub(",", "").to_i)
      puts matchdata[1].gsub(",", "").to_i
      return 1
    else
      puts "no match";
      return 6
    end
  end #end of function


  def getPopularAlbumWebRawDataImp album
        rw = RawWebData.new
        
        begin
          artist_name = ""
          artist = album.artist;
          if (artist != nil)
            artist_name = artist.name
          end
              
          retStr = rw.getLastfmAlbumPopularity(artist_name, album.name)
          
          html = ""
          if (retStr.empty?)
            status = 2
           else
             html = retStr
            status = 5
          end

          #WebsourceLastfm.delete_all(:altnet_id => artist.id)
          #artist.websource_lastfm.remove 
          wlf = WebsourceAlbumPopularLastfm.new
          wlf.album_id = album.id
          wlf.html = html.to_s
          wlf.url = rw.getLastfmAlbumPopularityUrl(artist_name, album.name)
          #wlf.url = ""
          wlf.save
          
          return status 
            
          
        rescue Exception => e
          puts e
          status = 4
          return status
        end
  end #end of function

  
end
