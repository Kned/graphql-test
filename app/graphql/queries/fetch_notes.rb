module Queries
  class FetchNotes < Queries::BaseQuery

    argument :user_id, ID, required: false
    type [Types::NoteType], null: false
    

    def resolve(user_id= nil)
      n = Note.where(user_id) unless user_id.nil?
      n ||= Note.all
      n.order(created_at: :desc)
    end
  end
end