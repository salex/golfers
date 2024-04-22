class ArticlesController < ApplicationController
  before_action :require_super
  before_action :set_notice, only: [:show, :edit, :update, :destroy, :display]


  # GET /inquiries
  # GET /inquiries.json

  def index
    @articles = Article.all
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
    # set_ptgolf
    @article = Article.new(stashable_type:"Golfer",
      stashable_id:1, 
      date:Date.today)
  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  # POST /inquiries.json
  def create

    @article = Article.new(stashable_type:"Golfer",
      stashable_id:1, 
      date:Date.today)

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to article_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def display
    puts "Should dispay notice #{params[:id]}"
    @article = Article.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def require_super
      cant_do_that(' - Not Authorized') unless current_user && current_user.is_super?
    end

    def set_notice
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title,:content,:date,:slim,:date,:status,:stashable_id, :stashable_type)

    end
end
