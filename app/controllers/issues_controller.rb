class IssuesController < ApplicationController
  load_and_authorize_resource
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all.order(status: :asc).order(date: :desc)
  end

  # GET /issues/new
  def new
    @issues = Issue.all
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
    @issues = Issue.all
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    @issue.date = Time.now

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: t('issue.created') }
        format.json { render action: 'index' }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    @issue.assign_attributes(issue_params)
    @issue.user = current_user
    @issue.date = Time.now
    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice:  t('issue.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:name, :text, :status)
    end
end
