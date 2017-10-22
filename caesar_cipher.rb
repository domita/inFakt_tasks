class CaesarCipher
  LAST_UPCASE_LETTER_ASCII = 90
  LAST_DOWNCASE_LETTER_ASCII = 122
  START_SHIFTING_FOR_UPCASE_LETTER = 64
  START_SHIFTING_FOR_DOWNCASE_LETTER = 96
  
  def initialize(text_to_encrypt,rot = 13)
    @text_to_encrypt = text_to_encrypt
    @rot = rot
  end

  def perform
    encrypted_text = ""
    @text_to_encrypt.each_char do |char|
      ascii_number=char.ord
      @rot.times do

        if check_ascii_number_upcase_downcase_letter?(ascii_number)
          ascii_number = ascii_number+1
        end
        if ascii_number == LAST_UPCASE_LETTER_ASCII 
          ascii_number=START_SHIFTING_FOR_UPCASE_LETTER
        end
        if ascii_number == LAST_DOWNCASE_LETTER_ASCII 
          ascii_number=START_SHIFTING_FOR_DOWNCASE_LETTER
        end
      end
      encrypted_text += ascii_number.chr
    end
    encrypted_text
  end

  private

  def check_ascii_number_upcase_downcase_letter?(ascii_number)   
    (ascii_number >= START_SHIFTING_FOR_UPCASE_LETTER && ascii_number < LAST_UPCASE_LETTER_ASCII ) ||
    (ascii_number >= START_SHIFTING_FOR_DOWNCASE_LETTER && ascii_number < LAST_DOWNCASE_LETTER_ASCII )
  end

end
CaesarCipher.new("Testowy Tekst").perform

