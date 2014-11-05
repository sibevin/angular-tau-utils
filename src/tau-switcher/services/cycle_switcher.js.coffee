# The cycle switcher service
angular.module("tau-switcher").factory "CycleSwitcher", ->
  # The cycle switcher class
  class CycleSwitcher
    # The default initial tabs
    DEFAULT_TABS: ["none"]

    # The initial tabs
    _tabs: @DEFAULT_TABS
    # The current index
    _current_index: 0

    # Move to the next tab, move to the first tab if
    # the current tab is the last one.
    next: =>
      if @_current_index + 1 >= @_tabs.length
        @_current_index = 0
      else
        @_current_index = @_current_index + 1

    # Move to the previous tab, move to the last tab if
    # the current tab is the first one.
    prev: =>
      if @_current_index - 1 < 0
        @_current_index = @_tabs.length - 1
      else
        @_current_index = @_current_index - 1

    # Reset the current tab to the initial tab.
    reset: =>
      @_current_index = 0

    # Get the current tag.
    #
    # @return [String] The current tab.
    #
    getTab: =>
      @_tabs[@_current_index]

    # Check the current tab is equal to the given tab or
    # in the given tab array.
    #
    # @param tab [String, Array<String>] A tab or an array of tabs to check.
    # @return [Boolean] true if matched, otherwise false.
    #
    isTab: (tab) =>
      if tab instanceof Array
        (@getTab() in tab)
      else
        (tab == @getTab())

    # Assign the current tag with the given tab,
    # nothing happens if given tab is not in the initial tabs.
    #
    # @param tab [String] A tab to assign to the current tab.
    #
    setTab: (tab) =>
      index = @_tabs.indexOf(tab)
      @_current_index = index unless index == -1

    # The cycle switcher constructor
    #
    # @param tabs [Array<String>] The initial tabs. The first tab
    #   in the initial tabs would become the initial tab.
    # @return [CycleSwitcher]
    #
    constructor: (tabs = @DEFAULT_TABS) ->
      @_tabs = tabs
      @reset()

  return CycleSwitcher
