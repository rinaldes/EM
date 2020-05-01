# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# Rails.application.config.assets.precompile += %w( ckeditor/* )

# Rails.application.config.assets.precompile += %w( css/bootstrap.min css/main css/plugins css/responsive css/icons)
Rails.application.config.assets.precompile += %w( css/*)
Rails.application.config.assets.precompile += %w( js/*)
Rails.application.config.assets.precompile += %w( jquery-ui/*)
Rails.application.config.assets.precompile += %w( plugins/*)
Rails.application.config.assets.precompile += %w( touchpunch/jquery.ui.touch-punch.min.js event.swipe/jquery.event.move.js event.swipe/jquery.event.swipe.js	respond/respond.min.js	cookie/jquery.cookie.min.js	slimscroll/jquery.slimscroll.min.js slimscroll/jquery.slimscroll.horizontal.min.js)
Rails.application.config.assets.precompile += %w( daterangepicker/* blockui/jquery.blockUI.min.js fullcalendar/fullcalendar.min.js )
Rails.application.config.assets.precompile += %w( noty/*)
Rails.application.config.assets.precompile += %w( uniform/jquery.uniform.min.js select2/select2.min.js)
Rails.application.config.assets.precompile += %w( bootbox/bootbox.js )
Rails.application.config.assets.precompile += %w( bootbox/bootbox.js )
Rails.application.config.assets.precompile += %w( pickadate/* )
Rails.application.config.assets.precompile += %w( defaults.js )
Rails.application.config.assets.precompile += %w( custom/* )
