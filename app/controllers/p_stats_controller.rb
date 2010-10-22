class PStatsController < ApplicationController
  # GET /p_stats
  # GET /p_stats.xml
  def index
    @p_stats = PStat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @p_stats }
    end
  end

  # GET /p_stats/1
  # GET /p_stats/1.xml
  def show
    @p_stat = PStat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @p_stat }
    end
  end

  # GET /p_stats/new
  # GET /p_stats/new.xml
  def new
    @p_stat = PStat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @p_stat }
    end
  end

  # GET /p_stats/1/edit
  def edit
    @p_stat = PStat.find(params[:id])
  end

  # POST /p_stats
  # POST /p_stats.xml
  def create
    @p_stat = PStat.new(params[:p_stat])

    respond_to do |format|
      if @p_stat.save
        format.html { redirect_to(@p_stat, :notice => 'PStat was successfully created.') }
        format.xml  { render :xml => @p_stat, :status => :created, :location => @p_stat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @p_stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /p_stats/1
  # PUT /p_stats/1.xml
  def update
    @p_stat = PStat.find(params[:id])

    respond_to do |format|
      if @p_stat.update_attributes(params[:p_stat])
        format.html { redirect_to(@p_stat, :notice => 'PStat was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @p_stat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /p_stats/1
  # DELETE /p_stats/1.xml
  def destroy
    @p_stat = PStat.find(params[:id])
    @p_stat.destroy

    respond_to do |format|
      format.html { redirect_to(p_stats_url) }
      format.xml  { head :ok }
    end
  end
end
