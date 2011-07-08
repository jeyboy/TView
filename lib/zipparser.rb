module Zipparser

  def self.upload_file(dir, params_)
    if params_[:f_field]
      fpath=dir+"/"+params_[:f_field].original_filename
      File.open(fpath, "wb") { |f| f.write(params_[:f_field].read) }
    else
      fpath = nil
    end
    fpath
  end


  def self.create(params_)
    params_[:admin][:path_test] ||= "public/data/"
    group={:dir_project => '', :img_url => '', :name_project => '', :tag =>''}
    group_dir=params_[:admin][:path_test]+ActiveSupport::SecureRandom.hex(4).to_s
    Dir.mkdir(group_dir)
    fpath=upload_file(group_dir,params_[:admin])
    group[:dir_project]=group_dir.gsub("public","")
    group[:img_url]=fpath.gsub("public","") if fpath
    group[:name_project]=params_[:admin][:name_project]
    group[:tag]=params_[:admin][:tag]
    group
  end


  def self.upload_zip(params_)
    out_hash={:template_group=>{:img_template=>'', :template_link => '',:group_id => '', :folder_template => ''}, :other_html => [{:f_name => '',:template_group_id=> '',:prev_img => ''}]  }
    grp=Group.find(params_[:admin][:group_id])
    params_[:path_test] == nil ? outdir="public"+grp.dir_project+"/"+ActiveSupport::SecureRandom.hex(4).to_s : outdir=grp.dir_project+"/"+ActiveSupport::SecureRandom.hex(4).to_s
    Dir.mkdir(outdir)
    fpath=upload_file(outdir,params_[:admin])    
    Zip::ZipFile::open(fpath) {
      |zf|
      zf.each { |e|
        path = File.join(outdir, e.name)
        FileUtils.mkdir_p(File.dirname(path))
        zf.extract(e, path)
      }
    }
    FileUtils.remove_file(fpath)
    Dir[outdir+"/index.*"].each { |index|     
      index.split('.')[1] == "html" ? out_hash[:template_group][:template_link]=index.gsub("public","") : out_hash[:template_group][:img_template]=index.gsub("public","")
    }
    out_hash[:template_group][:folder_template]=outdir.gsub("public","")
    out_hash[:template_group][:group_id]=grp.id
    i=0
    Dir[outdir+"/*.html"].each {|html|      
      if html.split('.')[0] != outdir+"/index"
        tmp={:f_name=>html.gsub("public","") ,:template_group_id=> '',:prev_img => Dir[html.split(".")[0]+"*.{jpg,png,gif,jpeg}"].first.gsub("public","") }
        out_hash[:other_html][i] =tmp
        i+=1
      end      
    }    
    
    out_hash
  rescue    
    out_hash
  end


  def self.create_zip(params_)
    dirpath=File.dirname(params_)
    flist=Dir["#{Rails.public_path}"+dirpath+'/**/**']
    dir_root=File.dirname(flist[0]) 
    temp = Tempfile.new("temp-"+ActiveSupport::SecureRandom.hex(4).to_s)
    Zip::ZipOutputStream.open(temp.path) do |zipfile|
      flist.each do |file|
        if File.file?(file)
          zipfile.put_next_entry(file.gsub(dir_root+"/",''))
          zipfile.write(IO.read(file))
        end
      end
    end
    temp
  end


end