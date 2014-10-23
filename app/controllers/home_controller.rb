class HomeController < ApplicationController
  def home
    pdf_filename = File.join(Rails.root, "/README.pdf")
    send_file(pdf_filename, :filename => "README.pdf", :disposition => 'inline', :type => "application/pdf")
  end
end