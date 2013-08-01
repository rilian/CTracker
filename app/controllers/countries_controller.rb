class CountriesController < ApplicationController
  load_and_authorize_resource :country

  respond_to :html, :xml, :json

  # GET /countries
  # GET /countries.xml
  def index
    @q = Country.search(params[:q])
    @countries = @q.result.includes(:user_countries)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/index_table
  # GET /countries/index_table.xml
  def index_table
    @q = Country.search(params[:q])
    @countries = @q.result.includes(:user_countries)

    respond_to do |format|
      format.html { render '_index_table', layout: nil}
      format.xml  { render '_index_table', :xml => @countries, layout: nil }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
  end

  # GET /countries/pie_chart.js
  def pie_chart
  end

  # GET /countries/line_chart.js
  def line_chart
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to(@country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  def visit_multiple
    @countries = Country.find(params[:country_ids])
    @countries.each do |country|
      country.visitor_id = current_user.id
      country.visited = true
      country.save
    end

    render nothing: true
  end
end
