class Upload < ActiveRecord::Base
  searchable do
    text :name
    integer :volume
    integer :chapter
    text :url
    time :created_at
  end

  # Assume the string is in the format
  # (Series Name) (Volume) X (Chapter) X
  def self.explode(string)
    string = string.split(' ')
    name = ''
    return_var = Array['','']
    string.each do |text|
      # If the text is "Volume" or "Chapter" (case-insensitive)
      if text.upcase == "Volume".upcase or text.upcase == "Chapter".upcase
        @index = text.upcase == "Volume".upcase ? 0 : 1
        next
      end
      if text.to_i.to_s == text
        unless @index.nil?
          return_var[@index] = text
          next
        end
        return_var.push(text)
        next
      end
      name = "#{name} #{text}"
    end
    return Array.new.push(name[1..-1]).push(return_var)
  end
end
