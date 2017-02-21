require 'rails_helper'

describe "Badges", type: :request do

  it 'creates a badge' do

  end

  it 'lists badges' do
    FactoryGirl.create_list(:badge, 10)

    get '/badges'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    #Test the JSON response
    expect(json.length).to eq(10)

  end


  it 'updates a badge' do

  end


  it 'deletes a badge' do

  end

end
