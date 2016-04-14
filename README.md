# GoogleTimeline

Welcome to Map Timeline (Google) integration!


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_timeline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_timeline

## Usage

```ruby
 GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml")
```
     => {:url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:}lvmA{f}xMVYi@GGAAAf@n@i@o@IDCKIC@?A?f@LLBFDaAYKCRFCAybCWn[vjEmXbbJk_CjhFhR`UjbGfwJrhN~cIjtJfoO~tI|{KxuIvdMz|E~~Sz[jzC~~JfpQ`zCznPljHdzSziJpyPliL|oLgfAfcJxtCnfI????tIjhDvI|wO~tC|hMsR`nAksAzhNyoAh`Im@G_@rzLweKnyMgaJb{IxvE~`G|wHztChCsq@imFy]ayEohBaDarHnwBirC??aWbS`WcS||BwvA`jLgyLhAyzGtpCaaVjSakMumDcmMbk@cxMshCa{MxuAcrIc|@avF}nD}fDamIgpFmxJe~NszEucRczBosHgsEyxQelEg_EEj@fAeFmLybCeqB_dFk{BqvNcpGqiHwlEygEa{Fg_LezHoiKswL}zGt_Bc|FfjCahSmbBmkI_|DbK&size=600x600&sensor=false"} 

or
```ruby
  GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml", {:distance=>true})
```
     => {:url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:}lvmA{f}xMVYi@GGAAAf@n@i@o@IDCKIC@?A?f@LLBFDaAYKCRFCAybCWn[vjEmXbbJk_CjhFhR`UjbGfwJrhN~cIjtJfoO~tI|{KxuIvdMz|E~~Sz[jzC~~JfpQ`zCznPljHdzSziJpyPliL|oLgfAfcJxtCnfI????tIjhDvI|wO~tC|hMsR`nAksAzhNyoAh`Im@G_@rzLweKnyMgaJb{IxvE~`G|wHztChCsq@imFy]ayEohBaDarHnwBirC??aWbS`WcS||BwvA`jLgyLhAyzGtpCaaVjSakMumDcmMbk@cxMshCa{MxuAcrIc|@avF}nD}fDamIgpFmxJe~NszEucRczBosHgsEyxQelEg_EEj@fAeFmLybCeqB_dFk{BqvNcpGqiHwlEygEa{Fg_LezHoiKswL}zGt_Bc|FfjCahSmbBmkI_|DbK&size=600x600&sensor=false", :distance=>{:value=>520181.2852676145, :unit=>"meter"}} 

or
```ruby
GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml", {:distance=>true}, {:home_coordinate=>[0,0]})
```
     => {:url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:}lvmA{f}xMVYi@GGAAAf@n@i@o@IDCKIC@?A?f@LLBFDaAYKCRFCAybCWn[vjEmXbbJk_CjhFhR`UjbGfwJrhN~cIjtJfoO~tI|{KxuIvdMz|E~~Sz[jzC~~JfpQ`zCznPljHdzSziJpyPliL|oLgfAfcJxtCnfI????tIjhDvI|wO~tC|hMsR`nAksAzhNyoAh`Im@G_@rzLweKnyMgaJb{IxvE~`G|wHztChCsq@imFy]ayEohBaDarHnwBirC??aWbS`WcS||BwvA`jLgyLhAyzGtpCaaVjSakMumDcmMbk@cxMshCa{MxuAcrIc|@avF}nD}fDamIgpFmxJe~NszEucRczBosHgsEyxQelEg_EEj@fAeFmLybCeqB_dFk{BqvNcpGqiHwlEygEa{Fg_LezHoiKswL}zGt_Bc|FfjCahSmbBmkI_|DbK&size=600x600&sensor=false", :distance=>{:value=>520181.2852676145, :unit=>"meter"}} 

distance and home_coordinate are optional.
distance: To measure the travel distance which will return value in meter
home_coordinate: to mention the home coordinate 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/surajit16/google_timeline.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
