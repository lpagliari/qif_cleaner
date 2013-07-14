require 'qif'

class BrQif
  PT_BR_ACCOUNT_TYPE = '!Type:Banco'
  EN_US_ACCOUNT_TYPE = '!Type:Bank'
  DATE_FORMAT        = "mm/dd/yy" # TODO should be "m/d'yy"

  def initialize(data)
    pt_br_data = translate_raw_pt_br_data(data)
    @qif = Qif::Reader.new(pt_br_data, DATE_FORMAT)

    translate_categories
  end

  def read
    @qif
  end

  private
  def translate_raw_pt_br_data(data)
    pt_br_data = data.gsub(PT_BR_ACCOUNT_TYPE, EN_US_ACCOUNT_TYPE)
    SpecialCharRemover.clear(pt_br_data)
  end

  def translate_categories
    @qif.each do |transaction|
      original_category = Category.instance_of(transaction.category)
      transaction.category = original_category.translate
    end
  end
end
