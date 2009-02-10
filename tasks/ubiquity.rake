
namespace :ub do
	require 'rubygems'
	require 'json'
	require 'uri'
	
	namespace :fetch do
		desc "Saves all commands to individual JS files"
		task :each do
			yaml_header = "---\nextension: js\nlayout: nil\n---\n\n"
			url_template = "http://gist.github.com/%s.txt"
			ub_dir = File.join(File.dirname(__FILE__), "../content/ubiquity")
			cmd_index = File.open(File.join(ub_dir, "ubiquity.json"), "r") {|file| file.read }
			json = JSON.parse(cmd_index)
		
			json['gists'].each do |gist|
				url = format(url_template, gist["id"])
				content = %x{curl #{url}}
				body = yaml_header + content
				name = gist["name"] + ".js"
				File.open(File.join(ub_dir, name), "w") {|file| file.write(body) }
				puts "created #{name} in #{File.expand_path(ub_dir)}"
			end
		end
		
		desc "Saves all commands to commands.js"
		task :all do
			yaml_header = "---\nextension: js\nlayout: nil\n---\n\n"
			url_template = "http://gist.github.com/%s.txt"
			ub_dir = File.join(File.dirname(__FILE__), "../content/ubiquity")
			cmd_index = File.open(File.join(ub_dir, "ubiquity.json"), "r") {|file| file.read }
			json = JSON.parse(cmd_index)
			buffer = yaml_header
			
			json["gists"].each do |gist|
				url = format(url_template, gist["id"])
				content = %x{curl #{url}}
				buffer += content
			end
			
			File.open(File.join(ub_dir, "commands.js"), "w") {|file| file.write(buffer) }
		end
	end
end