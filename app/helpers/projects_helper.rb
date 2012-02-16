module ProjectsHelper
  def secret s 
    str = ""
    if s.to_s == "1"
      str = "ใช่"
    elsif s.to_s == "0"
      str = "ไม่ใช่"
    end
    
    str
  end
end
