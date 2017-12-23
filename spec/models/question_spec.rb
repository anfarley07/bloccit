equire 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New Quetion Body", resolved: "True or False") }

  describe "attributes" do
    it "has title and body attributes" do
      expect(question).to have_attributes(title: "New Qustion Title", body: "New Question Body", resolved: "True or Falseß")
    end
  end
end
