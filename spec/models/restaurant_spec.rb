require 'rails_helper'

describe Restaurant, :type => :model do 
  it 'is not valid with a name of less than three characters' do
      restaurant = Restaurant.new(name: 'kf')
      expect(restaurant).to have(1).error_on(:name)
      expect(restaurant).not_to be_valid
  end  

  it '' do 
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

end

describe '#average_rating' do
  context 'no reviews' do
    it 'returns "N/A" when there are no reviews' do
      restaurant = Restaurant.create(name: "Huy Rest")
      expect(restaurant.average_rating).to eq "N/A"
    end
  end

  context '1 review' do
    it 'returns that rating' do 
      restaurant = Restaurant.create(name: "Kapusniak")
      restaurant.reviews.create(rating: 4)
      expect(restaurant.average_rating).to eq(4)
    end
  end

  context 'multiple reviews' do
    it 'returns the average' do
      restaurant = Restaurant.create(name: "Kapusniak")
      restaurant.reviews.create(rating: 4)
      restaurant.reviews.create(rating: 2)
      expect(restaurant.average_rating).to eq(3)
    end
  end

end