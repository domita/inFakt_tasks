require './../code/exam_results_assessor'

describe ExamResultsAssessor do
  
  describe "#assess" do

    subject  do
      ExamResultsAssessor.new(results, success_rate).assess
    end

    context "when no students attended exam" do
      let(:results) { {} }
      let(:success_rate) { 5 }
      it "returns no passed and failed exames" do
        students_results = { passed: {}, failed: {} }
        expect(subject).to eq(students_results)
      end
    end

    context "when one student attended exam" do

      context "and all students passed" do
        let(:results) { { "Mark" => 10 } }
        let(:success_rate) { 5 }        
        it "returns one passed and no failed" do
          expect(subject).to eq({ passed: { "Mark" => 10 }, failed:{} })
        end        
      end

      context "all students failed" do 
        let(:results) { {"Mark" => 10 } }
        let(:success_rate) { 15 }          
        it "returns all failed exames and no passed" do
          expect(subject).to eq({ passed: {}, failed:{ "Mark" => 10 } })
        end        
      end 

    end

    context "when multiple students attended exam" do

      context "and all of them passed" do
        let(:results) { { "Mark" => 20, "Ann" => 16, "Cleo" => 14, "Ivo" => 30 } }
        let(:success_rate) { 12 }        
        it "returns all passed and no failed" do
          expect(subject).to eq({ passed: { "Mark" => 20, "Ann" => 16, "Cleo" => 14, "Ivo" => 30 }, failed:{} })
        end
      end

     context "and all of them failed" do
        let(:results) { { "Mark" => 20, "Ann" => 16, "Cleo" => 14, "Ivo" => 30 } }
        let(:success_rate) { 40 }         
        it "returns all passed and no failed" do
          expect(subject).to eq({ passed: {}, failed:{"Mark" => 20, "Ann" => 16, "Cleo" => 14, "Ivo" => 30} })
        end
      end

      context "and some of them passed and some failed" do
        let(:results) { { "Mark" => 20, "Ann" => 16, "Cleo" => 14, "Ivo" => 30 } }
        let(:success_rate) { 17 }          
        it "returns all passed and no failed" do
          expect(subject).to eq({ passed: { "Mark" => 20, "Ivo" => 30}, failed:{ "Ann" => 16, "Cleo" => 14 } })
        end
      end
    end
  end
end

