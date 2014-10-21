# The pipe switcher service
angular.module("tau-switcher").factory "PipeSwitcher", ->
  # The pipe switcher class
  class PipeSwitcher
    # The default initial tabs
    DEFAULT_TABS: ["none"]

    # The initial tabs
    _tabs: @DEFAULT_TABS
    # The current index
    _current_index: 0
    # The initial index
    _init_index: 0

    # Move to the next tab, do nothing if
    # the current tab is the last one.
    next: =>
      @_current_index = @_current_index + 1 unless @isLast()

    # Move to the previous tab, do nothing if
    # the current tab is the first one.
    prev: =>
      @_current_index = @_current_index - 1 unless @isFirst()

    # Reset the current tab to the initial tab.
    reset: =>
      @_current_index = @_init_index

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

    # Check the current tab is the first tab or not.
    #
    # @return [Boolean] true if the current tab is the first one,
    #         otherwise false.
    #
    isFirst: =>
      @_current_index - 1 < 0

    # Check the current tab is the last tab or not.
    #
    # @return [Boolean] true if the current tab is the last one,
    #         otherwise false.
    #
    isLast: =>
      @_current_index + 1 >= @_tabs.length

    # Assign the current tag with the given tab,
    # nothing happens if given tab is not in the initial tabs.
    #
    # @param tab [String] A tab to assign to the current tab.
    setTab: (tab) =>
      index = @_tabs.indexOf(tab)
      @_current_index = index unless index == -1

    # The pipe switcher constructor
    #
    # @param tab [Array<String>] The initial tabs. The first tab
    #        in the initial tabs would become the initial tab if
    #        no init_tab is given.
    # @param init_tab [String] The initial tab.
    # @return [PipeSwitcher]
    #
    constructor: (tabs = @DEFAULT_TABS, init_tab = null) ->
      @_tabs = tabs
      @_init_index = tabs.indexOf(init_tab)
      @_init_index = 0 if @_init_index == -1
      @reset()

  return PipeSwitcher
