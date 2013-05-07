require 'spec_helper'

describe ModelsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "Go to edit page" do
    let!(:model) { Make.create! :name => 'Mustang' }
    it "returns http success" do
      visit edit_model_path(model)
      response.should be_success
    end
  end

end
