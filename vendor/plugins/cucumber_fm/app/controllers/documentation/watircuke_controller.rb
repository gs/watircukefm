class Documentation::WatircukeController < Documentation::ApplicationController
  
  layout '/documentation/layouts/mini'
  
  def runme                         
    @@testname = params[:test_name].split(".")[0] 
    browser = params[:watircuke_test][:browser_name].chomp                                                          
    runme_params = "ruby #{Dir.pwd}/watircuke.rb features/#{params[:test_name].downcase} #{@@testname} #{browser} web"
    Watircuke.start_process(runme_params)
  end

  def checkme 
    pid = Watircuke.find_process    
    if Watircuke.is_windows? && pid
      render :nothing => true
    elsif !Watircuke.is_windows? && pid.length > 2
      render :nothing => true
    else
      render :file => "#{Watircuke.find_test_folder}/#{@@testname}.html"
    end
  end

  def stopme    
    begin
      Watircuke.find_process.each do |pr|
       Process::kill 9, pr.chomp.to_i
      end
    rescue Exception => e
    end
    redirect_to :back
  end

  def results  
    @highlight = 'results'
    @result = list_results 
    render :layout => '/documentation/layouts/cucumber_fm'
  end


  def show_result        
    path = params[:id]
    f = find_file_result_in_folder(Rails.root.join(path))
    if f.empty?
      redirect_to :action => "results"
      flash[:notice] = "Could not show results...no html file found"
    else
      render :file => f.to_s
    end
  end
                          
  def delete
     path = params[:id] 
     remove_folder(path)
     flash[:notice]= "Folder was removed"
     redirect_to :action => "results"
  end                        
                              
  private
  
  def list_results
    Dir.glob("public/test_results/*")
  end                    
  
  def find_file_result_in_folder(folder) 
    Dir.glob("#{folder}/*.html")
  end
    
  def remove_folder(folder)
    FileUtils.remove_dir("#{Dir.pwd}/#{folder}")
  end  

end
