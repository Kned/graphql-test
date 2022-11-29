require 'rails_helper'

RSpec.describe "fetch_notes", type: :request do
  fixtures :users, :notes
  let(:graphql_endpoint) { '/graphql' }
  describe "Fetch notes" do

    context "Without filter" do
      it "return all notes" do
        query= %(
          query {
            fetchNotes {
              id
            }
          }
        )

        post(graphql_endpoint, params: { query: query })

        expect(JSON.parse(response.body)["data"]["fetchNotes"].count).to eq Note.count
      end
    end
    context "with filter to eduardo" do
      let(:user) { users(:eduardo)}

      it "return all notes" do
        query= %(
          query {
            fetchNotes(userId: #{user.id}) {
              id
            }
          }
        )

        post(graphql_endpoint, params: { query: query })

        expect(JSON.parse(response.body)["data"]["fetchNotes"].count).to eq Note.where(user_id: user.id).count
      end


    end
  end
end