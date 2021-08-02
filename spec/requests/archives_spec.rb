require 'swagger_helper'

RSpec.describe 'archives', type: :request do

  # first_user = User.create(
  #     email: FFaker::Internet.email,
  #     password: 'password',
  #     password_confirmation: 'password'
  # )
  # token = authenticate_user(first_user)
  # before(:each) do
  #   # post '/authentication', params: params.to_json, headers: { 'Content-Type' => 'application/json' }
  #   token = authenticate_user(first_user)
  # end

  path '/archives/{id}' do
    # token = authenticate_user(first_user)
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'Authorization', in: :header, type: :string, default: "Bearer c36e6eadde881ca7"

    patch('update archive') do
      response(200, 'successful') do
        let(:id) { user.id }

        schema type: :object,
           properties: {
               id: { type: :integer },
               type: { type: :string },
               attributes: {
                   type: :object,
                   properties: {
                       email: { type: :string },
                       archived: { type: :boolean }
                   }
               }
           },
           required: [ 'id', 'type', 'attributes' ]

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        let(:first_user) { create(:user) }
        let(:user) { create(:user) }
        # let(:Authorization) { 'Bearer ' + admin.authentication_token }
        run_test!
      end
    end

    # put('update archive') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }
    #
    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end
end
