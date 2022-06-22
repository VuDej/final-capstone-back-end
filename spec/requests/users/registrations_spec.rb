require 'swagger_helper'

RSpec.describe 'Registration', type: :request do
  path '/signup' do
    post 'Sign up' do
      tags 'register user'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {

          name: { type: :string },
          email: { type: :string },
          password: { type: :string }

        },
        required: %w[name email password]
      }
      response '200', 'sign up' do
        let(:user) do
          { user: { name: 'John', email: 'some1@some.com', password: '1234567', password_confirmation: '1234567' } }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:user) { { name: 'john', email: 'some@some.com', password: '123' } }
        run_test!
      end
    end
  end
end
