require 'swt_shoes/spec_helper'
require 'shoes/swt/text_block_cursor_painter'

describe Shoes::Swt::TextBlockCursorPainter do
  let(:dsl) { double("dsl", textcursor: textcursor) }
  let(:textcursor) { double("textcursor") }
  let(:fitted_layouts) { [] }

  subject { Shoes::Swt::TextBlockCursorPainter.new(dsl, fitted_layouts) }

  describe "missing cursor" do
    before(:each) do
      dsl.stub(:cursor) { nil }
    end

    it "shouldn't do anything without text cursor" do
      dsl.stub(:textcursor) { nil}
      expect(dsl).to receive(:textcursor=).never

      subject.draw
    end

    it "should remove leftover text cursor" do
      expect(dsl).to receive(:textcursor=)
      expect(textcursor).to receive(:remove)

      subject.draw
    end
  end

  describe "moves cursor" do
    it "should change something on the cursor" do
      dsl.stub(:cursor) { 1 }
      expect(textcursor).to receive(:move)

      subject.draw
    end
  end
end
