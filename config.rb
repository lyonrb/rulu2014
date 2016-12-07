###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Use directory indexes to get rid og .html suffixes in URLs
activate :directory_indexes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# See http://198.101.244.252/blog/shoehorn-zurb-foundation-into-weird-stuff/
foundation_path = Gem::Specification.find_by_name('zurb-foundation').gem_dir
set :js_assets_paths, [File.join(foundation_path, 'js')]
set :sass_assets_paths, [File.join(foundation_path, 'scss')]

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload

  # Disable Google Analytics
  activate :google_analytics do |ga|
    ga.tracking_id = 'null'
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Create a whole bunch of favicons for various devices and OSes
  activate :favicon_maker, icons: {
    'img/logo-ruby.png' => [
      { icon: 'apple-touch-icon-152x152-precomposed.png' },
      { icon: 'apple-touch-icon-144x144-precomposed.png' },
      { icon: 'apple-touch-icon-120x120-precomposed.png' },
      { icon: 'apple-touch-icon-114x114-precomposed.png' },
      { icon: 'apple-touch-icon-76x76-precomposed.png' },
      { icon: 'apple-touch-icon-72x72-precomposed.png' },
      { icon: 'apple-touch-icon-60x60-precomposed.png' },
      { icon: 'apple-touch-icon-57x57-precomposed.png' },
      { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
      { icon: 'apple-touch-icon.png', size: '57x57' },
      { icon: 'favicon-196x196.png' },
      { icon: 'favicon-160x160.png' },
      { icon: 'favicon-96x96.png' },
      { icon: 'favicon-32x32.png' },
      { icon: 'favicon-16x16.png' },
      { icon: 'favicon.png', size: '16x16' },
      { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
      { icon: 'mstile-144x144', format: 'png' }
    ]
  }

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # Add Google Analytics support
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-20067061-3'
  end
end

activate :blog do |blog|
    blog.prefix = "blog"
    blog.permalink = "{year}/{title}.html"
    blog.layout = "blog-layout"
end

activate :deploy do |deploy|
  # Deploy using git
  deploy.method = :git
  # Deploy on git remote named gh-pages
  deploy.remote = 'origin'
  # Deploy on branch master of this git remote
  deploy.branch = 'gh-pages'
end
