module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true

    # return portion
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(name:, email:)
      user = User.new(name: name, email: email)
      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.messages }
      end
    end
  end
end
