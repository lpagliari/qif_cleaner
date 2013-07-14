require 'qif'
require File.dirname(__FILE__) + '/lib/base'

files = ['ddmmyy_dirty.qif']
files.each do |file| 
  data = open("files/#{file}").read

  qif = BrQif.new(data).read

  original_transactions = data.count("^")
  puts "Transactions read for file '#{file}': #{qif.size} (out of #{original_transactions})"

  #qif.each do |transaction|
  #  puts [transaction.date, transaction.memo, transaction.amount, transaction.category, transaction.payee].join(', ')
  #end

  Qif::Writer.open("files/exported/clear_#{file}") do |writer|
    qif.transactions.each do |transaction|
      writer << transaction
    end
  end
end
