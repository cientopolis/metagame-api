require 'rails_helper'

describe "Players Requests", type: :request do
  it  'creates a player' do

  end

  it 'list players' do

    previous_length = Player.count

    FactoryGirl.create_list(:player, 10)

    get '/players'

    # test for the 200 status-code
    expect(response).to be_success

    json = JSON.parse(response.body)

     #Test the JSON response
    expect(json.length).to eq(10+previous_length)
  end

  it 'updates a player' do

  end

  it 'deletes a player' do

  end

end
