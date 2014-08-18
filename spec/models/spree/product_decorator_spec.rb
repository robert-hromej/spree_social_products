# coding: UTF-8

require 'spec_helper'


describe Spree::Product do

  context 'product instance' do
    let(:product) { create(:product) }
    let(:variant) { create(:variant, :product => product) }

    context "social_products" do

      it "generates urls for both http and https" do
        urls = product.get_urls_for_both_protocols("http://example.com/" + product.slug)
        expect(urls).to match { 
          http: "http://example.com/" + product.slug, 
          https: "https://example.com/" + product.slug
        }
      end

    end

  end

  
end
