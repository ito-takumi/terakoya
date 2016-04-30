require 'rails_helper'

RSpec.describe "top/show.html.slim", type: :view do
  it "has h1" do
    render
    expect(rendered).to match /<h1>/
  end
end
