class SubmissionsController < ApplicationController
  before_filter :load_student
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  # GET /submissions
  # GET /submissions.json
  def index
    # this is such an awful hack
    last_submissions = Student.all.map{|student| student.submissions.order(:tag).last }.compact
    last_not_graded_submissions = last_submissions.select{|s| s.status == "not_graded"}
    @submissions = last_not_graded_submissions.sort{|x, y| x.created_at <=> y.created_at}
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = @student.submissions.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = @student.submissions.new(submission_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @student, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    puts "FEEDBACK #{submission_params['feedback']}"
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @student, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to @student, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:feedback, :tag, :assignment_id, :student_id, :status)
    end

    def load_student
      @student = Student.find_by(slug: params[:student_id])
    end
end
