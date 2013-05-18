require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://charismaarts.com/page/"

i = 1

doc = Nokogiri::HTML(open(url + i.to_s))

title = doc.css('.entry-title').map(&:text).map(&:strip)
post = doc.css('.entry-content').map(&:text).map(&:strip)

puts i

puts title

File.open('/home/adam/rails_projects/ebooktest.txt', 'w') do |file|
	file.puts "Chapter #{i}: " + title[0]
	file.puts post
	file.puts @string
end	

while true do

	i += 1

	puts i

	doc = Nokogiri::HTML(open(url + i.to_s))

	title = doc.css('.entry-title').map(&:text).map(&:strip)
	post = doc.css('.entry-content').map(&:text).map(&:strip)

	puts title
	#puts post

	File.open('/home/adam/rails_projects/ebooktest.txt', 'a') do |file|
		file.puts "Chapter #{i}: " + title[0]
		file.puts post
		file.puts @string
	end

	break if i == 90
end