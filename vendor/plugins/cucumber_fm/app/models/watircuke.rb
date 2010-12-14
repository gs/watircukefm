class Watircuke       


  def self.browsers
    if Watircuke.is_windows?
      %w/ff ie chrome safari/ 
    else
      %w/ff chrome safari/ 
    end
  end      

  def self.find_test_folder
    Dir["public/test_results/*"].select{|x| File.directory?(x)}.map{|x| [File.ctime(x), x]}.sort_by{|x| x.first}.last.last
  end                                                                     

  def self.start_process(runme) 
    if Watircuke.is_windows?
      system("start \"WatirCuke\" #{runme}")
    else
      Process.fork { system(runme) } 
    end
  end         

  def self.find_process
    proc = []
    if Watircuke.is_windows?
      Sys::ProcTable.ps.each  do |pr|
        proc << pr.pid if pr.cmdline =~ /cucumber/i
      end
    else 
      temp = IO.popen("ps -ef | grep cucumber | awk '{print $2}'")
      proc = temp.to_a
      temp.close
    end
    return proc if proc.length > 0
  end              

  def self.is_windows?
    RUBY_PLATFORM.downcase.match(/mswin|i386-mingw32/)
  end


end
