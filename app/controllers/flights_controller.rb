class FlightsController < ApplicationController
  # GET /flights
  # GET /flights.json
  def date
    # Выдаем список полетов на дату
    #@flights = Flight.where('depart >= :depart AND depart <= :depart2',
    #                        {depart: '2013-01-04', depart2: '2013-01-25'}).order('depart ASC')
    #start_dt = params[:date] + ' 00:00:00'
    #end_dt = params[:date] + ' 23:59:59'
    #@flights = Flight.where('depart >= "2013-01-01 00:00:00" AND depart <= "2013-01-05 00:00:00"')
    start_dt = DateTime.parse(params[:date]).beginning_of_day
    end_dt = DateTime.parse(params[:date]).end_of_day
    @flights = Flight.where('depart >= :start AND depart <= :end',
                            {start: start_dt, end: end_dt}).order('depart ASC')

    if request.xhr?
      render partial: 'date.html.haml'
    end
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml { render text: 'Here I am' }
    #  format.json { render json: 'Here I am' }
    #end
  end

  def index
    @flights = Flight.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flights }
    end
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flight }
    end
  end

  # GET /flights/new
  # GET /flights/new.json
  def new
    @flight = Flight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flight }
    end
  end

  # GET /flights/1/edit
  def edit
    @flight = Flight.find(params[:id])
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(params[:flight])

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render json: @flight, status: :created, location: @flight }
      else
        format.html { render action: "new" }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flights/1
  # PUT /flights/1.json
  def update
    @flight = Flight.find(params[:id])

    respond_to do |format|
      if @flight.update_attributes(params[:flight])
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to flights_url }
      format.json { head :no_content }
    end
  end
end
