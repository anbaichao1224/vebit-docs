require 'logger'

# Unique header generation
require './lib/unique_head.rb'

# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    strikethrough: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true,
    renderer: UniqueHeadCounter

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax
ready do
  require './lib/monokai_sublime_slate.rb'
  require './lib/multilang.rb'
end

activate :sprockets

# activate :autoprefixer do |config|
#   config.browsers = ['last 2 version', 'Firefox ESR']
#   config.cascade  = false
#   config.inline   = true
# end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Internationalization support
activate :i18n, :mount_at_root => false, :locales => [:zh, :en]

# Build Configuration
configure :build do
  # Disable asset_hash, minify_css, minify_javascript to fix build errors
  # activate :asset_hash
  # activate :minify_css
  # activate :minify_javascript
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567

helpers do
  require './lib/toc_data.rb'
end
