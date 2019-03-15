# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Trip.destroy_all
Booking.destroy_all


places_array = ["Mexico City", "Cairo", "New York",  "Buenos Aires", "Istanbul", "Manila", "Rio de Janeiro", "Los Angeles", "Paris", "London", "Lima", "Bogota", "Chicago", "Tehran","Hong Kong", "Santiago","Madrid","Toronto","Miami","Pune","Belo Horizonte","Dallas-Fort Worth","Houston", "Barcelona","Atlanta", "St. Petersburg","Washington","Sydney","Dalian","Boston","Melbourne","Phoenix","Montréal","Medellin"]

previous = ""
photos_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=1600&photoreference="

def query_helper(word)
  split = word.split(" ")
  length = split.length
  return places_query_generator(word) if length == 1
  string = ""
  split.each_with_index do |each, index|
    if index == length - 1
      string += "#{each}"
    else
      string += "#{each}+"
    end
  end
  return places_query_generator(word)
end

def places_query_generator(normalized_input)
  places_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=trips+to+"
  api_key = "&key=" + ENV['GOOGLE_API_KEY']
  string = ""
  string = places_url + normalized_input + api_key
  return string
end

def get_picture(query)
  photos_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=1600&photoreference=#{query}&key=#{ENV['GOOGLE_API_KEY']}"
  photos_url
end

def create_instance(name, location, picture_url)
  first_names = ["Andiry", "Daniel", "Regi", "Jacob", "Arbi", "AIDS", "Giacomo <3"]
  password = 123456
  length = Array (1..20)
  cost = Array (1..200)
  user = User.new(name: first_names.sample, email: "#{first_names.sample}@lewagon.com", password: password)
  trip = Trip.new(name: name, destination: location, length: length.sample, cost: cost.sample)
  user.save
  trip.user = user
  trip.remote_photo_url = picture_url
  puts trip.remote_photo_url
  trip.save
end

# some comment

places_query_array = []
places_array.each { |place| places_query_array << query_helper(place) }
places_query_array = places_query_array.sample(5)

places_query_array.each do |query|
  response = open(query)
  response_json = JSON.parse(response.read)
  if response_json["status"] == "OK"
    results = response_json["results"]
    results.each do |result|
      location_results = result["formatted_address"]
      name_results = result["name"]
      if result["photos"]
        photo_results = get_picture(result["photos"][0]["photo_reference"])
        previous = photo_results
        create_instance(name_results, location_results, photo_results)
      else
        create_instance(name_results, location_results, previous)
      end
    end
  end
end
