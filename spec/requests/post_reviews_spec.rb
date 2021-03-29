require 'rails_helper'

describe 'post a review route', :type => :request do

  before do
    post '/reviews', params: { username: 'Duke Leto',
      title: 'This is the worst desert planet ever',
      content: 'Seriously get me out of here. There are weird fremen people here and they want my water',
      location_city: 'The Keep',
      location_country: 'Arrakas',
      rating: '1'}
  end

  it 'returns the user name' do
    expect(JSON.parse(response.body)['username']).to eq('Duke Leto')
  end

  it 'returns the title' do
    expect(JSON.parse(response.body)['title']).to eq('This is the worst desert planet ever')
  end

  it 'returns the content' do
    expect(JSON.parse(response.body)['content']).to eq('Seriously get me out of here. There are weird fremen people here and they want my water')
  end

  it 'returns the city' do
    expect(JSON.parse(response.body)['location_city']).to eq('The Keep')
  end

  it 'returns the country' do
    expect(JSON.parse(response.body)['location_country']).to eq('Arrakas')
  end

  it 'returns the rating' do
    expect(JSON.parse(response.body)['rating']).to eq(1)
  end
end