#!/usr/bin/env ruby
require 'pdf-reader' # gem install pdf-reader

# credits to :
# 	https://github.com/yob/pdf-reader/blob/master/examples/text.rb
# usage example: 
# 	ruby pdf2txt.rb /path-to-file/file1.pdf [/path-to-file/file2.pdf..]
filename = "arquivo.pdf"


PDF::Reader.open(filename) do |reader|

	puts "Convertendo : #{filename}"
	pageno = 0
	txt = reader.pages.map do |page| 

		pageno += 1
		begin
			print "Convertendo Pagina #{pageno}/#{reader.page_count}\r"
			page.text 
		rescue
			puts "Page #{pageno}/#{reader.page_count} Erro ao converter"
			''
		end

	  end # pages map

	  puts "\nFinalizado com Sucesso extração do texto, Salvo no disco!!!"
	  File.write filename+'.txt', txt.join("\n")

	end # reader

