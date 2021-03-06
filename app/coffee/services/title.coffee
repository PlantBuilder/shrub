
$module.service 'title', [
	'$rootScope', '$timeout'
	($rootScope, $timeout) ->
			
# Get and set the page title.
		_page = ''
		
		@page = -> _page
		@setPage = (page, setWindow = true) ->
			
			_page = page
			
			@setWindow [_page, _site].join _separator if setWindow
		
# Get and set the token that separates the page and window title.
		_separator = ' | '

		@separator = -> _separator
		@setSeparator = (separator) -> _separator = separator
		
# Get and set the site name.		
		_site = ''

		@site = -> _site
		@setSite = (site) -> _site = site
		
# Get and set the window title.		
		_window = _site

		@window = -> _windowWrapper _window
		@setWindow = (window) -> _window = window
		
# Certain things will want to make the window/tab title flash for attention.
# Those things will use this API to do so.
		_flashUpWrapper = (text) -> "¯¯¯#{text.toUpperCase()}¯¯¯"
		_flashDownWrapper = (text) -> "___#{text}___"
		_windowWrapper = angular.identity
		
		flashInProgress = null
		
		@flash = ->
			
# Don't queue up a million timeouts.
			return if flashInProgress?
			
			(flashTimeout = ->
				
				if _windowWrapper is _flashUpWrapper
					_windowWrapper = _flashDownWrapper
				else
					_windowWrapper = _flashUpWrapper
				
# It seems Angular has a memory leak in $timeout, so we'll use setTimeout
# unless it isn't available for some reason.
				flashInProgress = (setTimeout ? $timeout)(
					-> $rootScope.$apply -> flashTimeout()
					1200
				)
				
			)()	
			
# Restore the window/tab title to normal again.
		@stopFlashing = ->
			
			(clearTimeout ? $timeout.cancel) flashInProgress
			flashInProgress = null
			
			_windowWrapper = angular.identity
		
# The wrappers below handle rendering the window title and flash states. The
# wrappers are passed in a single argument, the title text. The wrapper
# function returns another string, which is the text after whatever wrapping
# you'd like to do.
		
# Get and set the window title wrapper.		
		@windowWrapper = -> _windowWrapper
		@setWindowWrapper = (windowWrapper) -> _windowWrapper = windowWrapper
		
# Get and set the flash down state wrapper.
		@flashDownWrapper = -> _flashDownWrapper
		@setFlashDownWrapper = (flashDownWrapper) -> _flashDownWrapper = flashDownWrapper
		
# Get and set the flash up state wrapper.
		@flashUpWrapper = -> _flashUpWrapper
		@setFlashUpWrapper = (flashUpWrapper) -> _flashUpWrapper = flashUpWrapper

		return
		
]
