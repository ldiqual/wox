module Wox
  class Builder < Task
    include Environment
    # def initialize(environment); super end
    
    def build
      configuration = environment[:configuration]
      sdk = environment[:sdk]
      puts "Building #{environment[:full_name]} configuration:#{configuration}"

      arch = sdk == "iphonesimulator" ? " -arch i386" : ""
      
      log_file = File.join environment[:build_dir], "build-#{configuration}.log"

      run_command "xcodebuild -target '#{environment[:target]}' -configuration #{configuration} -sdk #{sdk}#{arch}", :results => log_file
    end
  end
end