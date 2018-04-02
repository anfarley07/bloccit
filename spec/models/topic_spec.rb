require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { is_expected. to have_many(:posts) }

  describe "attributes" do #makes sure responds to right attributes
    it "has name, description, and public attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
    end

    it "is public by default" do #makes sure that the default for public is true
      expect(topic.public).to be(true)
    end
  end
end
