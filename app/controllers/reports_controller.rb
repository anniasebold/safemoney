class ReportsController < ApplicationController
  def new 
    @report = Report.new
    @post = Post.find(params[:id])
    respond_to do |format|
    format.html
    format.js
    end
  end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to root_url
    else 
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason, :description, :post_id)
  end

end
