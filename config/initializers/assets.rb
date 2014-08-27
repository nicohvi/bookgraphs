# Adding assets required to be precompiled but that are not concatinated
# into the main manifest files.

Rails.application.config.assets.precompile += %w( canvas.js )
