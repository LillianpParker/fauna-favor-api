require 'faraday'
require 'google_search_results' 
require 'json'

class AnimalsController < ApplicationController
  # GET /animals
  def random()
    random = rand(100050..120000)
    $i = 0
    $num = 5

    render json: {
      "primaryCommonName": "Common Checkered-Skipper",
      "scientificName": "Pyrgus communis",
      "iucn": "Not Available",
      "order": "Hesperiidae",
      "family": "Lepidoptera",
      "genus": "Pyrgus",
      "barriers": "Not Available",
      "justification": "Most species"
    }

    return

    while $i < $num do
      # response = Faraday.get "https://explorer.natureserve.org/api/data/taxon/ELEMENT_GLOBAL.2.#{random}"

      if response != nil && response.status == 200
        parsed_json = JSON(response.body)
        puts response
        #puts response.body
        #puts parsed_json
        info = {
          'primaryCommonName' => parsed_json['primaryCommonName'] || '',
          'scientificName' => parsed_json['scientificName'] || '',
          'iucn' => parsed_json.dig('iucn', 'iucnDescEn') || 'Not Available',
          'order' => parsed_json.dig('speciesGlobal', 'family') || 'Not Available',
          'family' => parsed_json.dig('speciesGlobal', 'taxorder') || 'Not Available',
          'genus' => parsed_json.dig('speciesGlobal', 'genus') || 'Not Available',
          'barriers' => parsed_json.dig('occurrenceDelineations', 0, 'separationBarriers') || 'Not Available',
          'justification' => parsed_json.dig('occurrenceDelineations', 0, 'separationJustification') || 'Not Available'
        }
        puts response.body
        render json: info
        return
      end
      $i +=1
    end
  end

  def search() 
    search = params['search_param']
    render json: search
    return
  end

  # def search ()
  #   GoogleSearch.api_key = process.env.api_key
  #   search = GoogleSearch.new(q: "#{primaryCommonName}")
  # end


  # GET /animals/1
  def show

  end

  # POST /animals
  def create
  end

  # PATCH/PUT /animals/1
  def update
  end

  # DELETE /animals/1
  def destroy
  end

end
