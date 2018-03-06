class GoogleMapTimeline
  attr_accessor :home_coordinate
  attr_accessor :file_path

  def initialize(file_path, home_coordinate)
    self.file_path = file_path
    self.home_coordinate = home_coordinate
  end

  def get_timeline_url(args)
    op_hash = {}
    url=default_map
    coordinates = []
    value = self.file_path
    key = Date.parse(value.split("/").last.split(".").first.gsub("history-", "")) rescue nil
    op_hash[:date] = key
    
    if key.nil? == false and File.exists?(value)
      kml = File.read(value)
      doc = Nokogiri::XML(kml)
      coordinates = doc.search('coordinates').map{|c| c.content.split(" ")}.flatten.map{|co| co.split(",")[0..1].reverse.map{|co1| co1.to_f}} rescue []
      if coordinates.is_a?(Array) 
        location_str = polylines_encoding(coordinates)

        if location_str.length > 1900
          coordinates_dup = coordinates.dup
          while location_str.length > 1900 do
            coordinates_dup = coordinates_dup.values_at(* coordinates_dup.each_index.select {|i| i.even?})
            location_str = polylines_encoding(coordinates_dup)
          end
        end
        url = location_url(location_str)  
      end

    end
    op_hash[:url] = url

    if (args.empty?)==false and (args.select{|a| a.is_a?(Hash) and a[:distance]==true}.first).nil? == false
      distance = {:value => overall_distance(coordinates), :unit=>"meter"}
      op_hash[:distance] = distance
    end
    return op_hash
  end

  private
  def location_url(location_str)
    "http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:#{location_str}&size=600x600&sensor=false"
  end

  def polylines_encoding(str)
    Polylines::Encoder.encode_points(str).gsub("\\", '%5c')
  end

  def default_map
    location_url(polylines_encoding(self.home_coordinate))
  end

  def overall_distance(coordinates)
    total_distance = 0
    for i in 0..(coordinates.count - 1)
      coo = coordinates[i]
      if i==0
        loc1 = coo
      else
        loc2 = coo
        total_distance += distance(loc1,loc2)
        loc1 = loc2
      end
    end
    return total_distance
  end

  def distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

end
