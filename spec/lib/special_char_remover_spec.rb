# encoding: utf-8

require 'spec_helper'

describe SpecialCharRemover do

  context '#clear' do
    subject { described_class.clear(text) }

    context "when text has 'á'" do
      let(:text) { '... á ...' }

      it "replaces by 'a'" do
	subject.should eq '... a ...'
      end
    end

    context "when text has 'à'" do
      let(:text) { '... à ...' }

      it "replaces by 'a'" do
	subject.should eq '... a ...'
      end
    end

    context "when text has 'ã'" do
      let(:text) { '... ã ...' }

      it "replaces by 'a'" do
	subject.should eq '... a ...'
      end
    end

    context "when text has 'â'" do
      let(:text) { '... â ...' }

      it "replaces by 'a'" do
	subject.should eq '... a ...'
      end
    end

    context "when text has 'é'" do
      let(:text) { '... é ...' }

      it "replaces by 'e'" do
	subject.should eq '... e ...'
      end
    end

    context "when text has 'ê'" do
      let(:text) { '... ê ...' }

      it "replaces by 'e'" do
	subject.should eq '... e ...'
      end
    end

    context "when text has 'í'" do
      let(:text) { '... í ...' }

      it "replaces by 'i'" do
	subject.should eq '... i ...'
      end
    end

    context "when text has 'ó'" do
      let(:text) { '... ó ...' }

      it "replaces by 'o'" do
	subject.should eq '... o ...'
      end
    end

    context "when text has 'õ'" do
      let(:text) { '... õ ...' }

      it "replaces by 'o'" do
	subject.should eq '... o ...'
      end
    end

    context "when text has 'ô'" do
      let(:text) { '... ô ...' }

      it "replaces by 'o'" do
	subject.should eq '... o ...'
      end
    end

    context "when text has 'ú'" do
      let(:text) { '... ú ...' }

      it "replaces by 'u'" do
	subject.should eq '... u ...'
      end
    end

    context "when text has 'ç'" do
      let(:text) { '... ç ...' }

      it "replaces by 'c'" do
	subject.should eq '... c ...'
      end
    end

    context "when text has 'Á'" do
      let(:text) { '... Á ...' }

      it "replaces by 'A'" do
	subject.should eq '... A ...'
      end
    end

    context "when text has 'À'" do
      let(:text) { '... À ...' }

      it "replaces by 'A'" do
	subject.should eq '... A ...'
      end
    end

    context "when text has 'Ã'" do
      let(:text) { '... Ã ...' }

      it "replaces by 'A'" do
	subject.should eq '... A ...'
      end
    end

    context "when text has 'Â'" do
      let(:text) { '... Â ...' }

      it "replaces by 'A'" do
	subject.should eq '... A ...'
      end
    end

    context "when text has 'É'" do
      let(:text) { '... É ...' }

      it "replaces by 'E'" do
	subject.should eq '... E ...'
      end
    end

    context "when text has 'Ê'" do
      let(:text) { '... Ê ...' }

      it "replaces by 'E'" do
	subject.should eq '... E ...'
      end
    end

    context "when text has 'Í'" do
      let(:text) { '... Í ...' }

      it "replaces by 'I'" do
	subject.should eq '... I ...'
      end
    end

    context "when text has 'Ó'" do
      let(:text) { '... Ó ...' }

      it "replaces by 'O'" do
	subject.should eq '... O ...'
      end
    end

    context "when text has 'Õ'" do
      let(:text) { '... Õ ...' }

      it "replaces by 'O'" do
	subject.should eq '... O ...'
      end
    end

    context "when text has 'Ô'" do
      let(:text) { '... Ô ...' }

      it "replaces by 'O'" do
	subject.should eq '... O ...'
      end
    end

    context "when text has 'Ú'" do
      let(:text) { '... Ú ...' }

      it "replaces by 'U'" do
	subject.should eq '... U ...'
      end
    end

    context "when text has 'Ç'" do
      let(:text) { '... Ç ...' }

      it "replaces by 'C'" do
	subject.should eq '... C ...'
      end
    end

  end
end
