require 'rails_helper'

RSpec.describe "add_note", type: :request do
  fixtures :users
  let(:graphql_endpoint) { '/graphql' }
  let(:user) { users(:fernando)}

  describe "add_note" do

    context "With user_id" do
      it "return all notes" do
        mutation= %(
          mutation {
            addNote(
              input: { 
                params: { 
                  title: "Titulo"
                  body: "Texto"
                  userId: #{user.id}
                }
              }
            ) {
              note {
                id
                title
                body
                user{
                  name
                }
              }
            }
          }
        )
        post(graphql_endpoint, params: { query: mutation })

        expect(JSON.parse(response.body)["data"]["addNote"]["note"]["title"]).to eq "Titulo"
        expect(JSON.parse(response.body)["data"]["addNote"]["note"]["body"]).to eq "Texto"
        expect(JSON.parse(response.body)["data"]["addNote"]["note"]["user"]["name"]).to eq "Fernando"
      end
    end
    context "Without user_id" do
      let(:user) { users(:eduardo)}

      it "return error" do
        mutation= %(
          mutation {
            addNote(
              input: { 
                params: { 
                  title: "Titulo"
                  body: "Texto"
                }
              }
            ) {
              note {
                id
              }
            }
          }
        )
        post(graphql_endpoint, params: { query: mutation })

        expect(JSON.parse(response.body)["errors"][0]["message"]).to eq "Argument 'userId' on InputObject 'NoteAttributes' is required. Expected type ID!"
      end


    end
  end
end