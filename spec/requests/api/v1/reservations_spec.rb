require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/reservations' do
    post 'Create Reservations' do
      tags 'Reservations'
      consumes 'application/json'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          pick_up_day: { type: 'string', format: 'date', required: true },
          return_day: { type: 'string', format: 'date', required: true },
          pick_up_city: { type: :string },
          return_city: { type: :string },
          user_id: { type: :integer },
          car_id: { type: :integer }
        },
        required: %w[pick_up_day return_day pick_up_city return_city user_id car_id]
      }

      response '401', 'reservation created' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
          eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
          CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        let(:reservation) do
          { user_id: 5, car_id: 7, pick_up_day: '2022-06-07', return_day: '2022-06-17', pick_up_city: 'Paris',
            return_city: 'Barcelona' }
        end
        run_test!
      end

      response '401', 'invalid request' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
          eyJqdGkiOiJmODkwODY3YS00NzlkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
          CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        let(:reservation) do
          { pick_up_date: '2022-06-07', drop_off_date: '2022-06-17', pick_up_city: 'Paris', return_city: 'Barcelona' }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations' do
    get('List of reservations') do
      tags 'Reservations'
      security [bearer_auth: []]
      parameter name: 'Authorization', in: :header, type: :string

      response '401', 'Authorized' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
            eyJqdGkiOiJmODkwODY3YS00Nz
            lkLTRiNzMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
            CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        run_test!
      end

      response '401', 'authentication failed' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.
            eyJqdGkiOiJmODkwODY3YS00NzlkLTRiN
            zMtOTY2OC05Y2ExNjBkNGQ3ZTciLCJmb28iOiJiYXIiLCJzdWIiOiIxNyIsInNjcCI6InVzZXIiL
            CJhdWQiOm51bGwsImlhdCI6MTY1NDU3MDgxMCwiZXhwIjoxNjU0NzUwODEwfQ.CIS8B1dDTLXxqVHrqELrnJZ6FTN--Lup6a21xAXCm8o'
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    delete('Delete Reservation') do
      tags 'Reservations'
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
