class WeatherController < ApplicationController
    def index
        weathers = Weather.all
        if(params[:date].present?)
            weathers = weathers.where(date: params[:date])
        end

        if(params[:city].present?)
            weathers = weathers.where('lower(city) = ?', params[:city].downcase)
        end

        if(params[:sort].present?)
            sorting_type = params[:sort] == 'date' ? :asc : :desc
            weathers = weathers.order(date: sorting_type)
        end

        render json: weathers.order(:id), status:200        
    end
    
    def show
        weather = Weather.find_by(id: params[:id])
        status = weather.present? ? 200 : 404
        render json: weather, status: status
    end

    def create
       # As per desciption,input is always valid 
       weather = Weather.create(weather_params) 
   
       render json: weather, status:201        
    end

   private
     def weather_params    
         params.permit(:date,:lat, :lon, :city, :state, :temperatures => [])
     end
end
