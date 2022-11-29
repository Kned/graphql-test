module Mutations
  class AddNote < Mutations::BaseMutation
    argument :params, Attributes::NoteAttributes, required: true

    field :note, Types::NoteType, null: true

    def resolve(params:)
      note_params = params.to_h

      begin
        note = Note.create!(note_params)

        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end