require 'open-uri'

class HomeController < ApplicationController
  def index
    
    @titles =Array.new
    
    193.downto(190) do |c|
      doc = Nokogiri::HTML(open("http://www.chungbuk.ac.kr/site/www/boardList.do?page=#{c}&boardSeq=112&key=698"));
      
      doc.css(".subject").each do |x|
        @titles << x.text if x.text.include?("공모")||x.text.include?("대회")
        @topic = @titles.uniq
        @linked = doc.search("a[@href]")
      end
      
    end
    
  end
end
