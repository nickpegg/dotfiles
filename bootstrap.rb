#!/usr/bin/ruby

require 'io/console'
require 'json'
require 'net/http'

# Generate SSH key
system('ssh-keygen -b 4096')

# Upload SSH key to github
gh_key = {
  'title' => `hostname`,
  'key' => File.read(File.expand_path('~/.ssh/id_rsa.pub'))
}

print 'GitHub username: '
gh_user = STDIN.gets.chomp

print 'GitHub password: '
gh_pass = STDIN.noecho(&:gets).chomp

print "\nGitHub 2fa code (leave blank if none): "
gh_2fa = STDIN.gets.chomp

gh_key_url = URI('https://api.github.com/user/keys')
req = Net::HTTP::Post.new(gh_key_url)
req.body = gh_key.to_json
req.basic_auth(gh_user, gh_pass)
req['X-GitHub-OTP'] = gh_2fa unless gh_2fa.empty?

puts "Adding SSH key to GitHub..."
http = Net::HTTP.new(gh_key_url.hostname, gh_key_url.port) 
http.use_ssl = true
res = http.start do |http|
  http.request(req)
end

puts res.body

