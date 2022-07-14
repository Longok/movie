Cloudinary.config do |config|
    config.cloud_name = "movie237-herokuapp-com"
    config.api_key = ENV["CL_API_KEY"]
    config.api_secret = ENV["CL_API_SECRET"]
    config.secure = true
end