require 'qif'
require File.dirname(__FILE__) + '/lib/base'

data = open('files/br_dirty.qif').read
clean_data = SpecialCharRemover.clear(data)
puts clean_data

#qif = Qif::Reader.new(data, "m/d'yy")
#puts "size = #{qif.size}"
#qif.each do |transaction|
#  puts [transaction.date, transaction.memo, transaction.amount].join(', ')
#end
