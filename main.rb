require 'qif'
require File.dirname(__FILE__) + '/lib/base'

data = open('files/br_clear.qif').read

qif = Qif::Reader.new(data, "mm/dd'yy")
puts "size = #{qif.size}"
qif.each do |transaction|
  puts [transaction.date, transaction.memo, transaction.amount].join(', ')
end
