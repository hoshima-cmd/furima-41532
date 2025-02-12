require 'rails_helper'

RSpec.describe 'Shareds', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/shared/index'
      expect(response).to have_http_status(:success)
    end
  end
end
