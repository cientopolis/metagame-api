require 'rails_helper'

describe "Players", type: :request do
  it  'creates a player' do

  end

  it 'list players' do
    FactoryGirl.create_list(:player, 10)

    get '/players'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    #Test the JSON response
    expect(json.length).to eq(10)
  end

  it 'updates a player' do

  end

  it 'deletes a player' do

  end

end
