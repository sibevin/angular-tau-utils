# The bool switcher service
angular.module("tau-switcher").factory "BoolSwitcher", ->
  # The bool switcher class
  class BoolSwitcher
    # The default initial boolean
    DEFAULT_BOOL: false

    # The initial boolean
    _init_bool: @DEFAULT_BOOL
    # The current boolean
    _current_bool: @DEFAULT_BOOL

    # Reset the current boolean to the initial boolean
    reset: =>
      @_current_bool = @_init_bool

    # Get the current boolean
    #
    # @return [Boolean] The current boolean.
    #
    getBool: =>
      @_current_bool

    # Set the current boolean
    #
    # @param bool [Boolean] A boolean to assign to the current boolean.
    #
    setBool: (bool) =>
      @_current_bool = if bool then true else false

    # Switch to the current boolean,
    # apply "not" operation on the current boolean.
    switch: =>
      @_current_bool = !@_current_bool

    # The bool switcher constructor
    #
    # @param bool [Boolean] The initial boolean.
    # @return {BoolSwitcher}
    #
    constructor: (bool = @DEFAULT_BOOL) ->
      @_init_bool = if bool then true else false
      @setBool(@_init_bool)

  return BoolSwitcher
