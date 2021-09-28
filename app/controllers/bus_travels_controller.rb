class BusTravelsController < ApplicationController
    
    def search_bus_travels
            from = params[:from]
            to = params[:to]
            class_alert = params[:class_alert]
            price = params[:price]
            date = params[:date]

            list_travels = []

            #date = Time.now 
            #date = date.strftime('%d-%m-%Y')

            search = Typhoeus::Request.new(
                    'https://demo.recorrido.cl/api/v2/es/bus_travels.json',
                    method: :post,
                    params: {bus_travel: {departure_city_id: from, destination_city_id: to, departure_date: date}},
                    userpwd: 'recorrido:recorrido'       
            )
            search.run
            response = search.response
            search_response = JSON.parse(response.body)
            status_search = Typhoeus.get(search_response["search_progres_url"], userpwd: 'recorrido:recorrido') 
            status_search = JSON.parse(status_search.body)

            if (status_search["progress_status"]=="complete")
                id_search = search_response["search_id"]
                search_result = Typhoeus.get("https://demo.recorrido.cl/api/v2/es/bus_travels/"+id_search.to_s+"/search_results.json", userpwd: 'recorrido:recorrido') 
                result = JSON.parse(search_result.body)
                result = result["outbound"]
                result = result["search_results"]
                #puts result
                result.sort_by{|item| item['price'].to_i}

                #result = result[0]

                result.each do |item| 
                     if class_alert.to_i == 5
                         if  item['price'].to_i <= price.to_i
                            list_travels.push([item['departure_time'], item['seat_klass'], item['price'], item['bus_operator_name']])
                         end 
                     else
                         if ( (item['seat_klass_stars'].to_i == class_alert.to_i) && (item['price'].to_i <= price.to_i ))
                            list_travels.push([item['departure_time'], item['seat_klass'], item['price'], item['bus_operator_name']])
                        end 
                     end
                  end 
                render :json => list_travels.first
            end

        

        #if search_response[""]
        #render partial: "bus_travels"
    end
end