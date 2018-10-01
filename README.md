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
You can get the google map url by passing the KML file. i.e.
```ruby
 GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml")
```
     => {:date=>#<Date: 2016-04-03 ((2457482j,0s,0n),+0s,2299161j)>, :url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:}lvmA{f}xMVYi@GGAAAf@n@i@o@IDCKIC@?A?f@LLBFDaAYKCRFCAybCWn[vjEmXbbJk_CjhFhR`UjbGfwJrhN~cIjtJfoO~tI|{KxuIvdMz|E~~Sz[jzC~~JfpQ`zCznPljHdzSziJpyPliL|oLgfAfcJxtCnfI????tIjhDvI|wO~tC|hMsR`nAksAzhNyoAh`Im@G_@rzLweKnyMgaJb{IxvE~`G|wHztChCsq@imFy]ayEohBaDarHnwBirC??aWbS`WcS||BwvA`jLgyLhAyzGtpCaaVjSakMumDcmMbk@cxMshCa{MxuAcrIc|@avF}nD}fDamIgpFmxJe~NszEucRczBosHgsEyxQelEg_EEj@fAeFmLybCeqB_dFk{BqvNcpGqiHwlEygEa{Fg_LezHoiKswL}zGt_Bc|FfjCahSmbBmkI_|DbK&size=600x600&sensor=false"}

or, you can pass the **{:distance => true}** parameter to get the total distance covered for the day 
```ruby
  GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml", {:distance=>true})
```
     => {:date=>#<Date: 2016-04-03 ((2457482j,0s,0n),+0s,2299161j)>, :url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:}lvmA{f}xMVYi@GGAAAf@n@i@o@IDCKIC@?A?f@LLBFDaAYKCRFCAybCWn[vjEmXbbJk_CjhFhR`UjbGfwJrhN~cIjtJfoO~tI|{KxuIvdMz|E~~Sz[jzC~~JfpQ`zCznPljHdzSziJpyPliL|oLgfAfcJxtCnfI????tIjhDvI|wO~tC|hMsR`nAksAzhNyoAh`Im@G_@rzLweKnyMgaJb{IxvE~`G|wHztChCsq@imFy]ayEohBaDarHnwBirC??aWbS`WcS||BwvA`jLgyLhAyzGtpCaaVjSakMumDcmMbk@cxMshCa{MxuAcrIc|@avF}nD}fDamIgpFmxJe~NszEucRczBosHgsEyxQelEg_EEj@fAeFmLybCeqB_dFk{BqvNcpGqiHwlEygEa{Fg_LezHoiKswL}zGt_Bc|FfjCahSmbBmkI_|DbK&size=600x600&sensor=false", :distance=>{:value=>520181.2852676145, :unit=>"meter"}}

or, you can pass the **{:home_coordinate => [x,y]}** parameter to define your home location.
```ruby
GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml", {:distance=>true}, {:home_coordinate=>[0,0]})
```
     => {:date=>#<Date: 2016-04-03 ((2457482j,0s,0n),+0s,2299161j)>, :url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:}lvmA{f}xMVYi@GGAAAf@n@i@o@IDCKIC@?A?f@LLBFDaAYKCRFCAybCWn[vjEmXbbJk_CjhFhR`UjbGfwJrhN~cIjtJfoO~tI|{KxuIvdMz|E~~Sz[jzC~~JfpQ`zCznPljHdzSziJpyPliL|oLgfAfcJxtCnfI????tIjhDvI|wO~tC|hMsR`nAksAzhNyoAh`Im@G_@rzLweKnyMgaJb{IxvE~`G|wHztChCsq@imFy]ayEohBaDarHnwBirC??aWbS`WcS||BwvA`jLgyLhAyzGtpCaaVjSakMumDcmMbk@cxMshCa{MxuAcrIc|@avF}nD}fDamIgpFmxJe~NszEucRczBosHgsEyxQelEg_EEj@fAeFmLybCeqB_dFk{BqvNcpGqiHwlEygEa{Fg_LezHoiKswL}zGt_Bc|FfjCahSmbBmkI_|DbK&size=600x600&sensor=false", :distance=>{:value=>520181.2852676145, :unit=>"meter"}}
     
or, you can pass the **{:places => true}** parameter to get all the location you travelled for the day.
```ruby
GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml", {:distance=>true}, {:home_coordinate=>[0,0]})
GoogleTimeline.get_timeline(v, {:distance=>true}, {:places=>true})
```
     => {:date=>Sun, 30 Sep 2018, :url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:mjvmAcg}xM????bALv%5cm@hAs_@|CrBlCl@`AIrCa@HEJCzCq@nBk@vAw@%5cIxAMHBDBbBz@|Ax@bBGJWBq@?QXmB^aE??iAiNhAhN??OtD]`BWbBzAr@ZFf@FB?B@jD`@|C@~Gh@`@FtBVJ@jDd@r@JBA????????AB?@AD???Cd@NpDd@fALtAFH?`E?`DHvEHZ?zALJ@J@fCb@v@N`JfAJAtB@fCEzC[HO@iAAMLCn@xCdBvAD@dAg@JGpHoFpLyIzMuJvAgA|GaFZStLuIpCuBfNuJ??pCbCfEbFbAvFR`ArAvAL@pJ`@|CbAa@nEI|@UjC?HAHi@|A}Dd@}C`AYNo@h@ADQzBAhAzEjBB?hACzCG|Ah@?r@EdC?Ng@tEOhEUrCJJnATLBN@~B%5c~Dp@dD`@ZHjAb@H?fBB~EuC????????yEnCgA@fM|PnYpQ~p@oSbyDeXnJ_]fx@kJ|_Anx@vAs@bCeA`B_AvDtBzExKdB~Dzc@cR`a@qVniJgjEdf@hWlgBpcBwHzC????????_uAeaBsiDxwAwnFzqA{]bVid@bY_GyP}E}J{z@oe@g}@w[aUl]svAp`@mvBfKaTpVG???A?????????u@L{KpBIAG?C?A?eBCoFW{@?g@BqCFU@cFFwIJgEt@IBo@FC@eBZ}FhA}Gw@o@I{Cc@O?kDK}@Ci@GGAOCGAa@AYCG?aCW}Co@kBqCC_AOaBKAG?iEo@mDWkAgBDs@HuA@AeBgAsGwA}Ey@m@I_BmAGKeDsE_BsBwBaBoAw@k@[MGgDoByC}@oBe@oA]IAIAICICGCwBk@eAe@pA}@h@a@tAeAJKhDqCeCv@mA|@kB~AGDOP?AAAC@?@SLmDJgAyAiC?YAo@BEDCGiC@yAIFNcBGIAG@gFo@oDw@i@Qs@IM?iEM_DIkDGQ?aCCK?cE[kDg@_Fu@oASyDa@KAK?wLo@yCa@SAUGAAPoBb@_Cx@oB????????a@Lwp@lZ{H`OkRnEwp@cIet@YqGOnEb@????????iE?wR?eVPgFdwA{ElWya@|Fs`@x^wFxDeVpSsTbYc`BcAox@xw@r@V????????RiE}FoHiEw@gETi@xG????????zA@tCiHuN`ZeKyBwY_G_Cb@gArB??zCvM{CwM??UrCe@jCyA~D????????rDsMtCqCJ}@tFem@????fNyGHN????????MShHxOg@hGOj@lLpFjl@xQdJpV|l@xEn_AgDvc@sJb[mLvN_IlXeP`QyEj`@aU`i@eW|q@ua@p@{Z|Ey`@~Tg]dS}k@?a@????&size=600x600&sensor=false", :distance=>{:value=>86940.98791306592, :unit=>"meter"}, :places=>["Home", "Sai Meadows", "Vijay Krishna Mansion", "Muthayala Maduvu", "WhitePearl ವೈಟ್ ಪರ್ಲ್", "Foradian", "Garuda Mall", "CENTRAL", "Tasker Town", "Max Fashion", "Mani's Dum Biryani", "Home"]}
     
or, you can pass the **{:transport_mode => true}** parameter to get all the Transport Mode you used for the day.
```ruby
GoogleTimeline.get_timeline("/home/surajit/Downloads/history-2016-04-03.kml", {:distance=>true}, {:home_coordinate=>[0,0]})
GoogleTimeline.get_timeline(v, {:distance=>true}, {:places=>true}, {:transport_mode=>true})
```
    => {:date=>Sun, 30 Sep 2018, :url=>"http://maps.googleapis.com/maps/api/staticmap?scale=2&path=enc:mjvmAcg}xM????bALv%5cm@hAs_@|CrBlCl@`AIrCa@HEJCzCq@nBk@vAw@%5cIxAMHBDBbBz@|Ax@bBGJWBq@?QXmB^aE??iAiNhAhN??OtD]`BWbBzAr@ZFf@FB?B@jD`@|C@~Gh@`@FtBVJ@jDd@r@JBA????????AB?@AD???Cd@NpDd@fALtAFH?`E?`DHvEHZ?zALJ@J@fCb@v@N`JfAJAtB@fCEzC[HO@iAAMLCn@xCdBvAD@dAg@JGpHoFpLyIzMuJvAgA|GaFZStLuIpCuBfNuJ??pCbCfEbFbAvFR`ArAvAL@pJ`@|CbAa@nEI|@UjC?HAHi@|A}Dd@}C`AYNo@h@ADQzBAhAzEjBB?hACzCG|Ah@?r@EdC?Ng@tEOhEUrCJJnATLBN@~B%5c~Dp@dD`@ZHjAb@H?fBB~EuC????????yEnCgA@fM|PnYpQ~p@oSbyDeXnJ_]fx@kJ|_Anx@vAs@bCeA`B_AvDtBzExKdB~Dzc@cR`a@qVniJgjEdf@hWlgBpcBwHzC????????_uAeaBsiDxwAwnFzqA{]bVid@bY_GyP}E}J{z@oe@g}@w[aUl]svAp`@mvBfKaTpVG???A?????????u@L{KpBIAG?C?A?eBCoFW{@?g@BqCFU@cFFwIJgEt@IBo@FC@eBZ}FhA}Gw@o@I{Cc@O?kDK}@Ci@GGAOCGAa@AYCG?aCW}Co@kBqCC_AOaBKAG?iEo@mDWkAgBDs@HuA@AeBgAsGwA}Ey@m@I_BmAGKeDsE_BsBwBaBoAw@k@[MGgDoByC}@oBe@oA]IAIAICICGCwBk@eAe@pA}@h@a@tAeAJKhDqCeCv@mA|@kB~AGDOP?AAAC@?@SLmDJgAyAiC?YAo@BEDCGiC@yAIFNcBGIAG@gFo@oDw@i@Qs@IM?iEM_DIkDGQ?aCCK?cE[kDg@_Fu@oASyDa@KAK?wLo@yCa@SAUGAAPoBb@_Cx@oB????????a@Lwp@lZ{H`OkRnEwp@cIet@YqGOnEb@????????iE?wR?eVPgFdwA{ElWya@|Fs`@x^wFxDeVpSsTbYc`BcAox@xw@r@V????????RiE}FoHiEw@gETi@xG????????zA@tCiHuN`ZeKyBwY_G_Cb@gArB??zCvM{CwM??UrCe@jCyA~D????????rDsMtCqCJ}@tFem@????fNyGHN????????MShHxOg@hGOj@lLpFjl@xQdJpV|l@xEn_AgDvc@sJb[mLvN_IlXeP`QyEj`@aU`i@eW|q@ua@p@{Z|Ey`@~Tg]dS}k@?a@????&size=600x600&sensor=false", :distance=>{:value=>86940.98791306592, :unit=>"meter"}, *:transport_mode=>{"Driving"=>67675, "Motorcycling"=>4157, "Walking"=>2216, "Moving"=>11810}*, :places=>["Home", "Sai Meadows", "Vijay Krishna Mansion", "Muthayala Maduvu", "WhitePearl ವೈಟ್ ಪರ್ಲ್", "Foradian", "Garuda Mall", "CENTRAL", "Tasker Town", "Max Fashion", "Mani's Dum Biryani", "Home"]}
     
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
