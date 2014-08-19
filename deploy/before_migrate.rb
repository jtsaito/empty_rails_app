app_short_name  = release_path.split("/")[3]

########################################################################################################################
# Set environment variables
########################################################################################################################

::File.open("#{release_path}/config/setenv.rb", "w") do |f|
  node[:deploy][app_short_name][:env].each do |key, value|
    f.puts %Q(ENV[#{key.inspect}] = #{value.to_s.inspect})
  end
end
