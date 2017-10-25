class ExamResultsAssessor

  def initialize(student_results, success_rate_threshold)
    @student_results        = student_results
    @success_rate_threshold = success_rate_threshold.to_i
  end

  def assess
    passed_students, failed_students = {}, {}
    
    @student_results.each do |name, score|
      passed_students[name] = score if passed_exam?(score)     
      failed_students[name] = score if failed_exam?(score)    
    end

    {
      :passed => passed_students,
      :failed => failed_students
    }
  
  end

  private

  def passed_exam?(score)
    score >= @success_rate_threshold
  end

  def failed_exam?(score)
    score < @success_rate_threshold
  end

end



