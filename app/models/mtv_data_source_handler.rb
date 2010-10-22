require 'hpricot'
class MtvDataSourceHandler < DataSource
    def initialize
      @DataSourceType = "mtv"  
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
          
          retStr = rw.getMtvData(artist.name)
          
          html = ""
          if (retStr.empty?)
            status = 2
           else
             html = retStr
            status = 5
          end

          WebsourceMtv.delete_all(:altnet_id => artist.id) 
          wlf = WebsourceMtv.new
          wlf.altnet_id = artist.id
          wlf.html = html.to_s
          wlf.url = rw.getMtvDataUrl(artist.name)
          #wlf.url = ""
          wlf.save
          
          return status 
            
          
        rescue Exception => e
          puts e
          status = 4
          return status
        end 
    
  end
  
  
  
  def analyzeSimilarArtistRawData art
    document = Hpricot(art.websource_mtv.html.to_s)
    sarts = document.search("a")
    
    
    RelateMtv.delete_all(:altnet_id => art.id)
    
    icount = 0
    ifound = 0
    sarts.each do |sart|
      regex = Regexp.new(/\/>(.*)<\/a>/)
      matchdata = regex.match(sart.to_s)
      
      icount = icount + 1
      
      if matchdata
        similar_artist_name = matchdata[1]         
        ifound = ifound + insertSimilarArtist(art.id, similar_artist_name, icount)        
      end
      
    end #end of iteration of artists 
    
    # icount = 0
    # keys = h.keys
    # if (keys.length > 0)
    #   puts keys.join(",")
    #   #before doing anything clean the table
    #   RelateMtv.delete_all(:altnet_id => art.id)
    #   
    #   Artist.find(:all, :conditions =>[ "name in (?)", keys.join(",") ]).each do |sa|
    #     rm = RelateMtv.new
    #     rm.altnet_id = art.id
    #     rm.similar_artist_id = sa.id       
    #     rm.position = h[sa.name]
    #     rm.score = rm.position 
    #     rm.save
    #     icount = icount + 1
    #   end # end of iteration
    # end #end of if

    if (ifound > 0)
      return 1
    else
      return 6
    end
  end #end of function


  def getSimilarArtistId artist
      
 
  end #end of function 
  
end
