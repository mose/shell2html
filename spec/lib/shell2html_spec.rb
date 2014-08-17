# encoding: utf-8

require 'spec_helper'
require 'shell2html'

describe Shell2html do

  let(:blue_text) { "\e[33mtext\e[0m" }

  describe '.to_html' do

    context 'when we input a sinple text' do
      it { expect(subject.to_html(blue_text)).to eq '<span class="blue">text</span>' }
    end

  end

end
