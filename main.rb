require 'qif'
require File.dirname(__FILE__) + '/lib/base'

data = open('files/ddmmyy_dirty.qif').read

qif = BrQif.new(data).read
puts "size = #{qif.size}"
qif.each do |transaction|
  puts [transaction.date, transaction.memo, transaction.amount, transaction.category, transaction.payee].join(', ')
end
