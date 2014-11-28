class Shoes
  def self.show_manual(lang = 'English')
    $lang = lang
    load 'shoes/ui/help.rb'
  end
end
