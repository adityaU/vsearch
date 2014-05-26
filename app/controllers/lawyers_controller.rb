class LawyersController < ApplicationController
  def show
    order = {
      'Highest First'=> 'DESC',
      'Lowest First' => 'ASC'
    }

    @featured_lawyers = Lawyer.where(:id => (0..5).map {1+ Random.rand(Lawyer.count)})

    @cities = Lawyer.select('DISTINCT city').map {|record| record.city}
    @services = Lawyer.select('DISTINCT service').map {|record| record.service}

    @selected_city = !params[:city] || params[:city] == '' ?  'Search By Location' : params[:city]
    @selected_service = !params[:service] ||  params[:service] == '' ? 'Search By Service' : params[:service]
    @selected_price_order = !params[:price] || params[:price] == '' ? 'Search By Price' : params[:price]


    arguements = {}
    arguements[:city] = params[:city] if params[:city] && params[:city] != ''
    arguements[:service] = params[:service] if  params[:service] && params[:service] !=''

    if params[:price] && params[:price] != ''
      @lawyers = Lawyer.order("base_price #{order[params[:price]]}" )
    else
      @lawyers = Lawyer
    end

    if arguements.length > 0
      @lawyers = @lawyers.where(arguements)
    else
      @lawyers = @lawyers.all
    end

    @lawyers = @lawyers - @featured_lawyers
    if params[:city] or params[:service] or params[:price]
      @search_result = true
    end

    respond_to do |format|
      format.html
      format.json  { render :json => @lawyers }
    end
  end

  def contact

    respond_to do |format|
      format.html
    end
  end
  def appointment
    
    respond_to do |format|
      format.html
    end
  end
end
