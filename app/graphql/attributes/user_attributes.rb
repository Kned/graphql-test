
module Attributes
  class UserAttributes < Types::BaseInputObject
    argument :name, String, required: true
  end
end