# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  content      :string(255)
#  published_on :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'
 
describe Page do
  before do
  	 @page = FactoryGirl.build(:page)
  end

  subject { @page }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:published_on) }

  describe "must include titles" do
    before { @page.title = nil }
    it { should_not be_valid }
  end

  describe "must include content" do
    before { @page.content = nil }
    it { should_not be_valid }
  end

  describe "titles must be unique" do
    before do
    	@page_not_unique_title = FactoryGirl.build(:page, content: "Unique content")
    	@page_not_unique_title.save
    end

    it {should_not be_valid}
  end 

  describe "Publishing" do
    before :each do
      @page_published = Page.create(attributes_for(:page))
      @page_unpublished = Page.create(attributes_for(:page_unpublished))
    end
    it "returns published pages" do
      expect(Page.published).to eq [@page_published]
    end
    it "returns unpublished pages" do 
      expect(Page.unpublished).to eq [@page_unpublished]
    end
  end
end
