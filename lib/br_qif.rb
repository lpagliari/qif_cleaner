# encoding: utf-8

require 'qif'

class BrQif
  PT_BR_ACCOUNT_TYPE     = '!Type:Banco'
  EN_US_ACCOUNT_TYPE     = '!Type:Bank'
  PT_BR_CC_ACCOUNT_TYPE  = '!Type:CartãoC'
  EN_US_CC_ACCOUNT_TYPE  = '!Type:CCard'

  DEFAULT_DATE_FORMAT = "m/d'yy"

  def initialize(data, date_format = DEFAULT_DATE_FORMAT)
    pt_br_data = translate_raw_pt_br_data(data)
    @qif = Qif::Reader.new(pt_br_data, date_format)

    translate_categories
  end

  def read
    @qif
  end

  private
  def translate_raw_pt_br_data(data)
    pt_br_data = translate_account_types(data)
    SpecialCharRemover.clear(pt_br_data)
  end

  def translate_account_types(data)
    data = data.gsub(PT_BR_ACCOUNT_TYPE, EN_US_ACCOUNT_TYPE)
    data = data.gsub(PT_BR_CC_ACCOUNT_TYPE, EN_US_CC_ACCOUNT_TYPE)
  end

  def translate_categories
    @qif.each do |transaction|
      original_category = Category.instance_of(transaction.category)
      transaction.category = original_category.translate
    end
  end
end
