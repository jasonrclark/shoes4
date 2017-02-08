# frozen_string_literal: true
require 'benchmark/ips'

Shoes.app do
  stack do
    button "unchanged" do
      Benchmark.ips do |benchmark|
        @progress.fraction = 0.0

        benchmark.report 'bunk' do
          @subject.style(bunk: true)
        end

        advance
        benchmark.report 'unchanged' do
          @subject.style(state: nil)
        end

        advance
        benchmark.report 'changing' do
          @counter += 1
          @subject.style(state: @counter)
        end

        advance
        benchmark.report 'visible' do
          @truth = !@truth
          @subject.style(hidden: @truth)
        end

        advance
      end
    end

    @truth = true
    @counter = 0
    @subject = edit_line "Styling will happen here"
    @progress = progress width: width - 20
  end

  def advance
    @progress.fraction += 0.25
  end
end
