require './../code/caesar_cipher'

describe CaesarCipher do
  describe "#perform" do

    subject do
      CaesarCipher.new(text_to_encrypt, rot).perform
    end

    context "when empty string" do
      let(:text_to_encrypt) {""}
      let(:rot) {5}
      it "returns empty string" do
        encrypted_text = ""
        expect(subject).to eq(encrypted_text)
      end
    end

    context "when string contain mix of special characters and uppercase and lowercase letters" do

      context "and shift is small" do
        let(:text_to_encrypt) {"@ #BLTgZ"}
        let(:rot) {5}
        it "returns encrypted text" do
          encrypted_text = "@ #GQYlE"
          expect(subject).to eq(encrypted_text)
        end
      end

      context "and shift is big" do
        let(:text_to_encrypt) {"@ #BLTgZ"}
        let(:rot) {32}
        it "returns encrypted text" do
          encrypted_text = "@ #HRZmF"
          expect(subject).to eq(encrypted_text)
        end
      end

    end

    context "when string is long and contain number" do

      context "and shift is small" do
        let(:text_to_encrypt) {"Very long string contain 6 words"}
        let(:rot) {5}
        it "returns encrypted text" do
          encrypted_text = "Ajwd qtsl xywnsl htsyfns 6 btwix"
          expect(subject).to eq(encrypted_text)
        end
      end

      context "and shift is big" do
        let(:text_to_encrypt) {"Very long string contain 6 words"}
        let(:rot) {32}        
        it "returns encrypted text" do
          encrypted_text = "Bkxe rutm yzxotm iutzgot 6 cuxjy"
          expect(subject).to eq(encrypted_text)
        end
      end  

    end

    context "shift has default value" do
      subject do
          CaesarCipher.new("T").perform
      end
      it "returns encrypted text" do
          encrypted_text = "G"
          expect(subject).to eq(encrypted_text)
      end
    end
  end
end