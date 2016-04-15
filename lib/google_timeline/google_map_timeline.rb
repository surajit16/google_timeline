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

    if key.nil? == false and File.exists?(value)
      kml = File.read(value)
      doc = Nokogiri::XML(kml)
      coordinates = doc.search('//gx:coord').map{|c| c.content.split(" ")[0..1].map{|co| co.to_f}.reverse} rescue []
      location_str = polylines_encoding(coordinates)

      if location_str.length < 1900
        url = location_url(location_str)
      else
        times = doc.search('when').map{|c| DateTime.parse(c.content)} rescue []

        coordinate_time_hash = {}
        times.each_with_index do |t, i|
          coordinate_time_hash[t] = coordinates[i]
        end

        interval = 10*60 #10min
        selected_coordinates = []
        prev_time = nil
        coordinate_time_hash.each do |k,v|
          if prev_time.nil?
            selected_coordinates << v
            prev_time = k
          else
            if (((k - prev_time) * 24 * 60 * 60).to_i >= interval)
              selected_coordinates << v
              prev_time = k
            end
          end
        end
        location_str = polylines_encoding(selected_coordinates)
        url=location_url(location_str)
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
    Polylines::Encoder.encode_points(str)
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
