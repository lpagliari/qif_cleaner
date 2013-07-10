require 'qif'
require File.dirname(__FILE__) + '/lib/base'

data = open('files/3_records_mmddyyyy.qif').read

qif = Qif::Reader.new(data)
puts "size = #{qif.size}"
qif.each do |transaction|
  puts [transaction.date, transaction.memo, transaction.amount].join(', ')
end
