# encoding: utf-8

require 'spec_helper'

describe BrQif do
  let(:pt_br_bank_account_type) { "!Type:Banco" }

  let(:pt_br_qif) do
    pt_br_bank_account_type << "\n" <<
    transaction             << "\n"
  end

  let(:transaction) do
    "^"
  end

  subject { described_class.new(pt_br_qif).read }

  it 'should create a QIF reader with transactions of file' do
    subject.transactions.should eq []
  end

  context 'with a pt_BR transaction' do
    let(:transaction) do
      "D01/07/08"       << "\n" << # TODO should be "D1/7'08"
      "PÃbçdêfghí..."   << "\n" <<
      "LPresentes"      << "\n" <<
      "^"
    end

    it 'should read transaction with correct date format' do
      subject.transactions[0].date.should eq Time.mktime(2008, 1, 7)
    end

    it 'should translate the category' do
      subject.transactions[0].category.should eq "Personal:Gifts"
    end

    it 'should remove special chars' do
      subject.transactions[0].payee.should eq "Abcdefghi..."
    end
  end

  context 'with a different data format' do
    let(:transaction) do
      "D07/01/2008" << "\n" <<
      "^"
    end

    subject { described_class.new(pt_br_qif, "dd/mm/yyyy").read }

    it 'should read transaction with correct date format' do
      subject.transactions[0].date.should eq Time.mktime(2008, 1, 7)
    end
  end

end
