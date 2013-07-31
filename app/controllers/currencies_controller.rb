class CurrenciesController < ApplicationController
  load_and_authorize_resource :currency

  # GET /currencies
  # GET /currencies.xml
  def index
    @q = Currency.search(params[:q])
    @currencies = @q.result

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  def collect_multiple
    @currencies = Currency.find(params[:currency_ids])
    @currencies.each do |currency|
      if currency.country.present? && country = currency.country
        country.visitor_id = current_user.id
        country.visited = true
        country.save!
      end
    end

    render nothing: true
  end
end
