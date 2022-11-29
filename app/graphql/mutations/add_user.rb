module Mutations
  class AddUser < Mutations::BaseMutation
    argument :params, Attributes::UserAttributes, required: true

    field :user, Types::UserType, null: true

    def resolve(params:)
      user_params = params.to_h

      begin
        user = User.create!(user_params)

        { user: user }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end