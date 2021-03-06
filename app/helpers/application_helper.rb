module ApplicationHelper

    #run the polygen on a grammar stored in the bin folder
    def polygen(grammar)
        polygen_binary = Rails.root.join("bin", "polygen").to_s 
        grammar_file = Rails.root.join("bin", grammar).to_s 
        #polygen_binary = "bin/polygen"
        #grammar_file = "bin/" + grammar
        full_command = polygen_binary + " " + grammar_file
        return IO.popen(full_command).read
    end

    #print the git version as given by git describe
    def get_git_version()
        command = "git --git-dir=%s --work-tree=%s describe --always --dirty --abbrev=4" %[Rails.root.join(".git").to_s, Rails.root.to_s]
        version = IO.popen(command).read
        version_no_dirty = version.gsub("-dirty", "-dir")
        return version_no_dirty
    end

end
