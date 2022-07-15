require 'pdf-reader'

reader = PDF::Reader.new("arquivo.pdf")
reader.pages.each do |page|
	puts page.text
end
