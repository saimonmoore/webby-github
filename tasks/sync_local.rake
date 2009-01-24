namespace :sync do
	
	desc "syncs this site's output dir with another local dir"
	task :local do
		rsync = %x(which rsync).chomp
		output_dir = SITE.output_dir
		sync_dir = '/Users/mike/Development/mikedamage.github.com'
		cmd = "#{rsync} -avr #{output_dir}/ #{sync_dir}/"
		%x(#{cmd})
	end
	
end