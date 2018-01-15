require 'rails_helper'

Rspec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) {Topic.create!(name: RandomData.random_sentence, description:RandomData.random_paragraph) }

  let(:my_sponsoredpost) {my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price)}

  describe "GET show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to render_template :show
    end

    it "assigns my_sponsoredpost to @sponsoredpost" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(assigns(:sponsoredpost)).to eq(my_sponsoredpost)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect (response).to render_template :new
    end

    it "initiates @sponsoredpost" do
      get :new, params: { topic_id: my_topic.id }
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of SponsoredPost by 1" do
      expect{ sponsoredpost :create, params: { topic_id: my_topic.id, sponsoredpost: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price }}
    end

    it "assigns the new post to @post" do
      post :create, params: { topic_id: my_topic.id, sponsoredpost: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price } }
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end

  end
end
