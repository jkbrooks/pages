require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Api::PagesController do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::PagesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all pages as @pages" do
      page = create(:page)
      get :index
      assigns(:pages).should eq([page])
    end
    it "returns json" do
      page = create(:page)
      get :index, format: :json
      expect(response.body).to have_content page.to_json
    end
  end

  describe "GET show" do
    it "assigns the requested page as @page" do
      page = create(:page)
      get :show, {:id => page.to_param}, valid_session
      assigns(:page).should eq(page)
    end

    it "returns json" do
      page = create(:page)
      get :show, {:id => page.to_param}, valid_session, format: :json
      expect(response.body).to have_content page.to_json
    end
  end

  describe "GET new" do
    it "assigns a new page as @page" do
      get :new, {}, valid_session
      assigns(:page).should be_a_new(Page)
    end
  end

  describe "GET edit" do
    it "assigns the requested page as @page" do
      page = create(:page)
      get :edit, {:id => page.to_param}, valid_session
      assigns(:page).should eq(page)
    end

    it "returns json" do
      page = create(:page)
      get :edit, {:id => page.to_param}, valid_session, format: :json
      expect(response.body).to have_content page.to_json
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Page in the database" do
        expect {
          post :create, {page: attributes_for(:page)}, valid_session
          }.to change(Page, :count).by(1)
      end

      it "assigns a newly created page as @page" do
        post :create, {page: attributes_for(:page)}, valid_session
        assigns(:page).should be_a(Page)
        assigns(:page).should be_persisted
      end

      it "returns json" do
        expect{
          post :create, {page: attributes_for(:page)}, valid_session
          }.to have_content page.to_json
      end
    end
    describe "with invalid params" do 
      it "does not save the new page in the database" do
        expect {
          post :create, {page: attributes_for(:page_invalid)}, valid_session
          }.to_not change(Page, :count).by(1)
      end

      #FUTURE TEST - redirects to new page with errors
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested page" do 
        page = create(:page)
        #page = Page.create! valid_attributes
        # Assuming there are no other pages in the database, this
        # specifies that the Page created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Page.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => page.to_param, :page => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested page as @page" do
        page = create(:page)
        put :update, {:id => page.to_param, :page => { "title" => "MyString" }}, valid_session
        assigns(:page).should eq(page)
      end

      it "returns json" do
        page = create(:page)
        put :update, {:id => page.to_param, :page => { "title" => "MyString" }}, valid_session, format: :jason
        expect(response.body).to have_content page.to_json
      end

    end

    describe "with invalid params" do
      it "assigns the page as @page" do 
        page = create(:page)
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        put :update, {:id => page.to_param, page: attributes_for(:page_invalid)}, valid_session
        assigns(:page).should eq(page)
      end

      #FUTURE TEST - redirects to edit
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page" do
      page = create(:page)
      expect {
        delete :destroy, {:id => page.to_param}, valid_session
      }.to change(Page, :count).by(-1)
    end
  end
end
