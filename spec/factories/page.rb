FactoryGirl.define do 
	factory :page do
		title "Example Title"
  	content "Here is some sample content"
  	published_on "2013-06-02 02:28:12"
	end 
	factory :page_invalid, :class => "Page" do
		title ""
  	content ""
  	published_on "2013-06-02 02:28:12"
	end 
end