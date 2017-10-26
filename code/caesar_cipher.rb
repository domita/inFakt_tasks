class CaesarCipher
  FIRST_UPCASE_LETTER_ASCII = 65
  LAST_UPCASE_LETTER_ASCII = 90
  FIRST_DOWNCASE_LETTER_ASCII = 97
  LAST_DOWNCASE_LETTER_ASCII = 122
  
  def initialize(text_to_encrypt,rot = 13)
    @text_to_encrypt = text_to_encrypt
    @rot = rot
  end

  def perform
    encrypted_text = ""
    @text_to_encrypt.each_char do |char|
      ascii_number=char.ord
      @rot.times do

        if check_ascii_number_upcase_letter?(ascii_number)
          if check_ascii_number_end_of_upcase_ascii_range?(ascii_number)
            ascii_number = FIRST_UPCASE_LETTER_ASCII
          else
            ascii_number = ascii_number+1
          end
          
        end

        if check_ascii_number_downcase_letter?(ascii_number)
          if check_ascii_number_end_of_downcase_ascii_range?(ascii_number)
            ascii_number = FIRST_DOWNCASE_LETTER_ASCII
          else 
            ascii_number = ascii_number+1
          end          
        end
        
      end
      encrypted_text += ascii_number.chr
    end
    encrypted_text
  end

  private

  def check_ascii_number_upcase_letter?(ascii_number)   
    (ascii_number >= FIRST_UPCASE_LETTER_ASCII && ascii_number <= LAST_UPCASE_LETTER_ASCII ) 
  end
  def check_ascii_number_downcase_letter?(ascii_number)
    (ascii_number >= FIRST_DOWNCASE_LETTER_ASCII && ascii_number <= LAST_DOWNCASE_LETTER_ASCII) 
  end
   def check_ascii_number_end_of_upcase_ascii_range?(ascii_number)   
    (ascii_number ==  LAST_UPCASE_LETTER_ASCII) 
  end
  def check_ascii_number_end_of_downcase_ascii_range?(ascii_number)
    (ascii_number == LAST_DOWNCASE_LETTER_ASCII) 
  end

end

