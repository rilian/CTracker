class CurrenciesController < ApplicationController
  load_and_authorize_resource :currency

  respond_to :html, :xml, :json

  # GET /currencies
  # GET /currencies.xml
  def index
    @q = Currency.search(params[:q])
    @currencies = @q.result

    respond_with(@currencies, @q)
  end

  # GET /currencies/index_table
  # GET /currencies/index_table.xml
  def index_table
    @q = Currency.search(params[:q])
    @currencies = @q.result

    respond_to do |format|
      format.html { render '_index_table', layout: nil }
      format.xml { render '_index_table', :xml => @currencies, layout: nil }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_with @currency
  end

  # GET /currencies/pie_chart.json
  def pie_chart
  end

  # GET /currencies/line_chart.json
  def line_chart
  end

  def collect_multiple
    @currencies = Currency.find(params[:currency_ids])
    @currencies.each do |currency|
      if currency.country.present? && country = currency.country
        country.visit!(current_user)
      end
    end

    render nothing: true
  end
end
