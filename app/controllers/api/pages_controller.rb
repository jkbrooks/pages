class Api::PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    render json: @pages
  end 
  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    render json: @page
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    if @page.save
      render json: @page, status: :created 
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
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

    render json: @page
  end

  # GET /pages/1/edit
  # GET /pages/1/edit.json
  def edit
    @page = Page.find(params[:id])

    render json: @page
  end
  
  # GET /pages/published
  # GET /pages/published.json
  def published
    @pages = Page.published

    render json: @pages
  end

  # GET /pages/unpublished
  # GET /pages/unpublished.json
  def unpublished
    @pages = Page.unpublished

    render json: @pages
  end

  # GET /pages/1/total_words
  # GET /pages/1/total_words.json
  def total_words
    @page = Page.find(params[:id])
    @word_count = @page.title.length + @page.content.length

    render json: @word_count
  end

  # POST /pages/1/publish
  # POST /pages/1/publish.json
  def publish
    @page = Page.find(params[:id])
    @page.published_on = Time.now
    @page.save

    render json: @page
  end
end