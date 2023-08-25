# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      components: {
        securitySchemes: {
          bearer_auth: { # Define the security scheme
            type: :http,
            scheme: :bearer,
            bearerFormat: 'JWT'
          }
        }
      },
      security: [
        {
          bearer_auth: [] # Use the defined security scheme
        }
      ],
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:3000/'
            }
          }
        }
      ]
    }
  }

  # ... other configuration settings ...
end
