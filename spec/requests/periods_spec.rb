 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/periods", type: :request do
  # Period. As you add validations to Period, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Period.create! valid_attributes
      get periods_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      period = Period.create! valid_attributes
      get periods_url(periods)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_periods_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      period = Period.create! valid_attributes
      get edit_periods_url(periods)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Period" do
        expect {
          post periods_url, params: { period: valid_attributes }
        }.to change(Period, :count).by(1)
      end

      it "redirects to the created period" do
        post periods_url, params: { period: valid_attributes }
        expect(response).to redirect_to(periods_url(Period.lasts))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Period" do
        expect {
          post periods_url, params: { period: invalid_attributes }
        }.to change(Period, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post periods_url, params: { period: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested period" do
        period = Period.create! valid_attributes
        patch periods_url(periods), params: { periods: new_attributes }
        period.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the period" do
        period = Period.create! valid_attributes
        patch periods_url(periods), params: { periods: new_attributes }
        period.reload
        expect(response).to redirect_to(periods_url(period))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        period = Period.create! valid_attributes
        patch periods_url(periods), params: { periods: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested period" do
      period = Period.create! valid_attributes
      expect {
        delete periods_url(periods)
      }.to change(Period, :count).by(-1)
    end

    it "redirects to the periods list" do
      period = Period.create! valid_attributes
      delete periods_url(periods)
      expect(response).to redirect_to(periods_url)
    end
  end
end
