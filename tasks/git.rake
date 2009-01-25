namespace :git do
	require 'git'
	
	desc "commits changes into local dev repository"
	task :commit do
		repo = Git.open(Dir.pwd)
		repo.chdir do
			repo.add
			print "Commit Message: "
			msg = $stdin.gets.chomp
			repo.commit(msg)
		end
	end
	
	desc "pushes to remote dev repository"
	task :push do
		repo = Git.open(Dir.pwd)
		repo.chdir do
			repo.push('origin', 'master')
		end
	end
	
	desc "pushes local output repo to Github Pages"
	task :publish => ['sync:local'] do
		repo = Git.open('/Users/mike/Development/mikedamage.github.com')
		repo.chdir do
			repo.add
			print "Commit Message: "
			msg = $stdin.gets.chomp
			repo.commit(msg)
			repo.push('origin', 'master')
		end
	end
	
end