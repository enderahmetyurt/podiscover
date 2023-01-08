require "rails_helper"

RSpec.describe CategoriesComponent, type: :component do
  it "renders category name" do
    podcast = FactoryBot.create(:podcast)
    category = FactoryBot.create(:category)
    FactoryBot.create(:genre, podcast:, category:)

    rendered = render_inline(described_class.new(name: podcast.categories.first.name))

    expect(rendered.to_s).to eq("<span class=\"text-sm font-thin text-gray-400\"><a href=\"/categories/#{category.id}\">##{category.name}</a></span>")
  end
end
