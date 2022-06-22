require 'swagger_helper'

RSpec.describe 'Registration', type: :request do
  path '/login' do
    post 'Log in' do
      tags 'user session'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {

          email: { type: :string },
          password: { type: :string }

        },
        required: %w[email password]
      }

      response '200', 'log in' do
        @user = User.create(name: 'some', email: 'something@mail.com', password: '1234567',
                            password_confirmation: '1234567')
        email = @user.email
        let(:user) do
          { user: { email:, password: '1234567' } }
        end
        run_test!
      end
      response '401', 'invalid request' do
        let(:user) do
          { user: { email: 'some@some.com', password: '123' } }
        end
        run_test!
      end
    end
  end

  path '/logout' do
    delete(' delete session') do
      tags 'Logout'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      response '401', 'Logout' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
          eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
          CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end

        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
          eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
          CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        run_test!
      end
    end
  end
end
