require 'rails_helper'

RSpec.describe SearchesController, type: :controller do

	describe "GET #new" do
		it "redirects upon successful new search" do
	  get :new
		expect(response).to have_http_status(:redirect)
		end
	end	

	describe "POST #create" do
		it "successfully creates a search" do
		post :create
		expect(response).to have_http_status(:redirect)
		end
	end
		
	describe "GET #show" do
		it "shows results of search" do
		get :show
		expect(response).to have_http_status(:success)
		end
	end

end
