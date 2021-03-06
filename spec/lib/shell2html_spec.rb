# encoding: utf-8

require 'spec_helper'
require 'shell2html'

describe Shell2html do

  let(:unknown_text) { "\e[12mtext\e[0m" }
  let(:blue_text) { "\e[34mtext\e[0m" }
  let(:bold_blue_text) { "\e[1;34mtext\e[0m" }

  describe '.to_html' do

    context 'when we need css classes, ' do

      context 'when we input a text with an unknown foreground color, ' do
        it { expect(subject.to_html(unknown_text)).to eq '</span><span>text</span>' }
      end

      context 'when we input a text with a simple foreground color, ' do
        it { expect(subject.to_html(blue_text)).to eq '</span><span class="sh_fg_blue">text</span>' }
      end

      context 'when we input a text with a bold foreground color, ' do
        it { expect(subject.to_html(bold_blue_text)).to eq '</span><span class="sh_bold sh_fg_blue">text</span>' }
      end
    end

    context 'when we need inline styles, ' do
      context 'when we input a text with a simple foreground color, ' do
        it { expect(subject.to_html(blue_text,true)).to eq '</span><span style="color:#1e90ff">text</span>' }
      end
    end

  end

  describe '.css' do
    let(:expected) { File.read(File.expand_path('../../files/colors.css', __FILE__)) }
    it { expect(subject.css).to eq expected }
  end

  describe '.sass' do
    let(:expected) { File.read(File.expand_path('../../files/colors.sass', __FILE__)) }
    it { expect(subject.sass).to eq expected }
  end

end
