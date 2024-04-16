module ShowHelper
  def callout_warning(content)
    tag.div class:'px-4 mt-4 bg-yellow-100 border-l-8 border-yellow-500 relative' do 
      concat(tag.button('&cross;'.html_safe,
        class:"absolute -top-3 -right-3 bg-red-500 hover:bg-red-600 text-2xl w-10 h-10 rounded-full focus:outline-none text-white",
          onclick:"this.parentElement.style.display='none'")) 
      concat(tag.br)
      concat(content)
    end
  end
  def callout_alert(content)
    tag.div class:'px-4 mt-4 bg-red-200 border-l-8 border-red-500 relative' do  
      concat(tag.button('&cross;'.html_safe,
        class:"absolute -top-3 -right-3 bg-red-500 hover:bg-red-600 text-2xl w-10 h-10 rounded-full focus:outline-none text-white",
          onclick:"this.parentElement.style.display='none'")) 
      concat(tag.br)
      concat(content)
    end
  end
  def callout_info(content)
    tag.div class:'px-4 mt-4 bg-blue-200 border-l-8 border-blue-500 relative' do  
      concat(tag.button('&cross;'.html_safe,
        class:"absolute -top-3 -right-3 bg-red-500 hover:bg-red-600 text-2xl w-10 h-10 rounded-full focus:outline-none text-white",
          onclick:"this.parentElement.style.display='none'")) 
      concat(tag.br)
      concat(content)
    end
  end
  def callout_success(content)
    tag.div class:'px-4 mt-4 bg-green-100 border-l-8  border-green-500 relative' do  
      concat(tag.button('&cross;'.html_safe,
        class:"absolute -top-3 -right-3 bg-red-500 hover:bg-red-600 text-2xl w-10 h-10 rounded-full focus:outline-none text-white",
          onclick:"this.parentElement.style.display='none'")) 
      concat(tag.br)
      concat(content)
    end
  end
end
