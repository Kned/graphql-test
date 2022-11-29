require 'rails_helper'

RSpec.describe "add_user", type: :request do
  fixtures :users
  let(:graphql_endpoint) { '/graphql' }

  describe "add_user" do
    it "return all notes" do
      mutation= %(
        mutation {
          addUser(
            input:{
              params: {
                name: "Henrique"
              }
            }
          ){
            user{
              name
            }
          }
        }
      )
      post(graphql_endpoint, params: { query: mutation })

      expect(JSON.parse(response.body)["data"]["addUser"]["user"]["name"]).to eq "Henrique"
    end

  end
end