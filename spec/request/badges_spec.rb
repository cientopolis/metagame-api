require 'rails_helper'

describe "Badges Requests", type: :request do

  it 'creates a Login badge' do
    previous_length = Badge.count
    post '/badges',{name:"login_test",project_id:galaxy_conqueror.id,points:1,badge_type:"login"}

  end

  it 'lists badges' do

    previous_length = Badge.count

    FactoryGirl.create_list(:badge, 10)

    get '/badges'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    #Test the JSON response
    expect(json.length).to eq(10+previous_length)

  end


  it 'updates a badge' do

  end


  it 'deletes a badge' do

  end

end
