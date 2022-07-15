#!/usr/bin/env ruby
# coding: utf-8

# Extract all text from a single PDF

require 'rubygems'
require 'pdf/reader'

PDF::Reader.open("arquivo.pdf") do |reader|
  reader.pages.each do |page|
    puts page.text
  end
end