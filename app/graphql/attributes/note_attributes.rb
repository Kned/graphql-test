
module Attributes
  class NoteAttributes < Types::BaseInputObject
    argument :title, String, required: true
    argument :body, String, required: true
    argument :user_id, ID, required: true
  end
end