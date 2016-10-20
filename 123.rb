#!/usr/bin/env ruby


require 'net/http'


	puts "Please enter zipcode"
	x1 = gets.chomp
	puts "You entered #{x1}"

	#if you have NO APPID from OpenWeatherMap.org, comment 'uri' and 'rsp' for TEST
	uri = URI("http://api.openweathermap.org/data/2.5/weather?zip=#{x1},us&APPID=XXX - Enter API KEY here - XXX")

	rsp = Net::HTTP.get(uri)
	
	#if you have NO APPID from OpenWeatherMap.org, uncomment 'rsp' (delete '=begin' and '=end') for TEST
=begin	
	rsp = '{"coord":{"lon":-122.09,"lat":37.39},"sys":{"type":3,"id":168940,"message":0.0297,"country":"US","sunrise":1427723751,"sunset":1427768967},"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],"base":"stations","main":{"temp":285.68,"humidity":74,"pressure":1016.8,"temp_min":284.82,"temp_max":286.48},"wind":{"speed":0.96,"deg":285.001},"clouds":{"all":0},"dt":1427700245,"id":0,"name":"Mountain View","cod":200}'
=end
	
	x2 = rsp.index('sunrise')
	if x2
		x3 = rsp.index(',"sunset"')
		x4 = rsp[(x2+9)...x3]
		x5 = Time.at(x4.to_i).to_s
		x6 = x5[11...20]

		y2 = rsp.index('name')
		y3 = rsp.index('","cod"')
		y4 = rsp[(y2+7)...y3]
		puts "Next Sunrise at this location (#{y4}) would be at #{x6}"
	else
		puts "Ups!!!"
	end


	