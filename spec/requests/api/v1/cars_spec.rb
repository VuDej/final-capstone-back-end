require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do
  path '/api/v1/cars' do
    get('list cars') do
      tags 'Cars'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      response(401, 'return a list of cars') do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
          eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
          CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        run_test!
      end
      response(401, 'Invalid request') do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
          eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
          CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        run_test!
      end
    end
  end

  path '/api/v1/cars' do
    post 'Create Car' do
      tags 'Cars'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          car_model: { type: :string },
          price_per_day: { type: :integer },
          description: { type: :string },
          photo: { type: :string },
          car_type: { type: :string },
          transmission: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[name fuel seats navigation car_type photo price_for_day city]
      }

      response '401', 'car created' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
        eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
        CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        let(:car) do
          { car_model: 'Toyota', price_per_day: 2000, description: 'This is a car', photo: 'photo.jpeg',
            car_type: 'jeep', transmission: 'manual' }
        end
        run_test!
      end

      response '401', 'invalid request' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
        eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
        CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        let(:car) { { car_model: 'Toyota', price_per_day: 2000, description: 'This is a car' } }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show car') do
      tags 'Cars'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      response(200, 'successful') do
        let(:id) { '7' }

        response '401', 'successfully authenticated' do
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

  path '/api/v1/cars/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show car') do
      tags 'Cars'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      response(200, 'successful') do
        let(:id) { '7' }

        response '401', 'successfully authenticated' do
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

  path '/api/v1/cars/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    delete('Delete Car') do
      tags 'Cars'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      response(200, 'successful') do
        let(:id) { '7' }

        response '401', 'successfully authenticated' do
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
end
