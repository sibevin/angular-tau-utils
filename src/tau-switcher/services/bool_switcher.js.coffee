angular.module("tau-switcher").factory "BoolSwitcher", ->
  class BoolSwitcher
    DEFAULT_BOOL: false

    _init_bool: @DEFAULT_BOOL
    _current_bool: @DEFAULT_BOOL

    reset: =>
      @_current_bool = @_init_bool

    getBool: =>
      @_current_bool

    setBool: (bool) =>
      @_current_bool = if bool then true else false

    switch: =>
      @_current_bool = !@_current_bool

    constructor: (bool = @DEFAULT_BOOL) ->
      @_init_bool = if bool then true else false
      @setBool(@_init_bool)

  return BoolSwitcher
