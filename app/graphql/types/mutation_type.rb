module Types
  class MutationType < Types::BaseObject
    field :add_note, mutation: Mutations::AddNote
    field :add_user, mutation: Mutations::AddUser
  end
end