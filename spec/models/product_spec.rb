require 'rails_helper'

describe Product do

  context "when the product has comments" do

    before do
      @product = Product.create!(name: "race bike")
      @user = User.create!(email: "test@now.com", password: "deez guys")
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "OK bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Great bike!")
    end

    it "return the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

  end

  context "is not valid" do
  
    it "return an error on product save" do
      expect(Product.new(description: "nice bike")).not_to be_valid
    end
  end
end
