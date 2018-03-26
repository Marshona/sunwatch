class WeatherController < ApplicationController
  def form
    @states = %w(PR GA WI IL CA)
    @states.sort!
  end

  def display
  if params[:city] != nil
      params[:city].gsub! " ", "_"
      end
      response = HTTParty.get("http://api.wunderground.com/api/#{ENV['wunderground_key']}/geolookup/conditions/q/#{params[:state]}/#{params[:city]}.json")

    if response['response']['error'] != nil
        flash[:notice] =  "None such a place!"
        redirect_to action: :form
    else
      @res = {city: response['location']['city'],
        state: response['location']['state'],
        country: response['location']['country'],
        updated: response['current_observation']['observation_time'],
        weather: response['current_observation']['weather'],
        weather_icon: response['current_observation']['icon_url'],
        temp: response['current_observation']['temp_f'],
        wind: response['current_observation']['wind_string'],
        more_link: response['current_observation']['forecast_url']}

    end
  end
end