require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe "GET index" do
    it "should return 200 and render index" do
      get :index

      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end

  end

  describe "GET generator" do
    it "should create a new url object" do
      expect{ get :generator, :original => 'http://example.com'
        }.to change{ Url.count }.by(1)
      expect(response).to render_template(:generator)
      expect(response.status).to eq(200)
    end

    it "should not create a new url object with an invalid url" do
      expect{ get :generator, :original => 'example'
      }.to change{ Url.count }.by(0)
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    let(:url) { FactoryGirl.create(:url) }
    it "should create a new url object" do
      get :show, :url_safe => "#{url.url_safe}"

      expect(response).to redirect_to(url.original)
      expect(response.status).to eq(302)
    end
  end
end
