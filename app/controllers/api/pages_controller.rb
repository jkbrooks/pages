class Api::PagesController < ApplicationController
  include ActionController::MimeResponds

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format| 
      format.json {render json: @pages}
      format.xml {render xml: @pages}
    end

  end 
  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.json {render json: @page} 
      format.xml {render xml: @page}
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    if @page.save
      respond_to do |format|
        format.json {render json: @page, status: :created }
        format.xml {render xml: @page, status: :created}
      end
      
    else
      respond_to do |format|
        format.json {render json: @page.errors, status: :unprocessable_entity}
        format.xml {render xml: @page.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      respond_to do |format|
        format.json {render json: @page, status: :created }
        format.xml {render xml: @page, status: :created}
      end
      
    else
      respond_to do |format|
        format.json {render json: @page.errors, status: :unprocessable_entity}
        format.xml {render xml: @page.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    head :no_content
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.json {render json: @page}
      format.xml {render xml: @page}
    end
  end

  # GET /pages/1/edit
  # GET /pages/1/edit.json
  def edit
    @page = Page.find(params[:id])

    respond_to do |format|
      format.json {render json: @page}
      format.xml {render xml: @page}
    end
  end
  
  # GET /pages/published
  # GET /pages/published.json
  def published
    @pages = Page.published

    respond_to do |format|
      format.json {render json: @pages}
      format.xml {render xml: @pages}
    end
  end

  # GET /pages/unpublished
  # GET /pages/unpublished.json
  def unpublished
    @pages = Page.unpublished

    respond_to do |format|
      format.json {render json: @pages}
      format.xml {render xml: @pages}
    end
  end

  # GET /pages/1/total_words
  # GET /pages/1/total_words.json
  def total_words
    @page = Page.find(params[:id])
    @word_count = @page.title.length + @page.content.length

    respond_to do |format|
      format.json {render json: @word_count}
      format.xml {render xml: @word_count}
    end
  end

  # POST /pages/1/publish
  # POST /pages/1/publish.json
  def publish
    @page = Page.find(params[:id])
    @page.published_on = Time.now
    @page.save

    respond_to do |format|
      format.json {render json: @pages}
      format.xml {render xml: @pages}
    end
  end
end