class RelateMusicbrainzsController < ApplicationController
  # GET /relate_musicbrainzs
  # GET /relate_musicbrainzs.xml
  def index
    @relate_musicbrainzs = RelateMusicbrainz.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relate_musicbrainzs }
    end
  end

  # GET /relate_musicbrainzs/1
  # GET /relate_musicbrainzs/1.xml
  def show
    @relate_musicbrainz = RelateMusicbrainz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relate_musicbrainz }
    end
  end

  # GET /relate_musicbrainzs/new
  # GET /relate_musicbrainzs/new.xml
  def new
    @relate_musicbrainz = RelateMusicbrainz.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relate_musicbrainz }
    end
  end

  # GET /relate_musicbrainzs/1/edit
  def edit
    @relate_musicbrainz = RelateMusicbrainz.find(params[:id])
  end

  # POST /relate_musicbrainzs
  # POST /relate_musicbrainzs.xml
  def create
    @relate_musicbrainz = RelateMusicbrainz.new(params[:relate_musicbrainz])

    respond_to do |format|
      if @relate_musicbrainz.save
        format.html { redirect_to(@relate_musicbrainz, :notice => 'RelateMusicbrainz was successfully created.') }
        format.xml  { render :xml => @relate_musicbrainz, :status => :created, :location => @relate_musicbrainz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @relate_musicbrainz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relate_musicbrainzs/1
  # PUT /relate_musicbrainzs/1.xml
  def update
    @relate_musicbrainz = RelateMusicbrainz.find(params[:id])

    respond_to do |format|
      if @relate_musicbrainz.update_attributes(params[:relate_musicbrainz])
        format.html { redirect_to(@relate_musicbrainz, :notice => 'RelateMusicbrainz was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relate_musicbrainz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relate_musicbrainzs/1
  # DELETE /relate_musicbrainzs/1.xml
  def destroy
    @relate_musicbrainz = RelateMusicbrainz.find(params[:id])
    @relate_musicbrainz.destroy

    respond_to do |format|
      format.html { redirect_to(relate_musicbrainzs_url) }
      format.xml  { head :ok }
    end
  end
end
