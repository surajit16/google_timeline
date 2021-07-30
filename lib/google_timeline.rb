require "google_timeline/version"
require "google_timeline/google_map_timeline"
require 'date'
require 'nokogiri'
require 'polylines'

module GoogleTimeline
  def self.get_timeline(file_path,*args)
    home_coordinate = [[22.6520393, 88.407874]]
    google_api_key = ""
    if (args.empty?)==false and (args.select{|a| a.is_a?(Hash) and a[:home_coordinate]}.first).nil? == false
      home_coordinate = [args.select{|a| a.is_a?(Hash) and a[:home_coordinate]}.first[:home_coordinate]]
    end
    if (args.empty?)==false and (args.select{|a| a.is_a?(Hash) and a[:google_api_key]}.first).nil? == false
      google_api_key = [args.select{|a| a.is_a?(Hash) and a[:google_api_key]}.first[:google_api_key]].first
    end

    google_timeline = GoogleMapTimeline.new(file_path,home_coordinate, google_api_key)
    google_timeline.get_timeline_url(args)
  end
end
