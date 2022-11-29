module Types
  class QueryType < Types::BaseObject
    field :fetch_notes, resolver: Queries::FetchNotes
  end
end
