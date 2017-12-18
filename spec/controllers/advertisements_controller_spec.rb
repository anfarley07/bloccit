require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_advertisement) {Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: my_advertisement.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_advertisement.id }
      expect(response).to render_template :show
    end

    it "assigns my_advertisement to @advertisement" do
      get :show, params: { id: my_advertisement.id }
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end

end
