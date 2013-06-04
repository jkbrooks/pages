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
  
  # GET /pages
  # GET /pages.json
  def published
    @pages = Page.published

    render json: @pages
  end

  # GET /pages
  # GET /pages.json
  def unpublished
    @pages = Page.unpublished

    render json: @pages
  end
end