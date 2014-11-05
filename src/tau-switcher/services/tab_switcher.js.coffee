# The tab switcher service
angular.module("tau-switcher").factory "TabSwitcher", ->
  # The tab switcher class
  class TabSwitcher
    # The default initial tab
    DEFAULT_TAB: "none"

    # The initial tab
    _init_tab: @DEFAULT_TAB
    # The current tab
    _current_tab: @DEFAULT_TAB

    # Reset the current tab to the initial tab
    reset: =>
      @_current_tab = @_init_tab

    # Get the current tag
    #
    # @return [String] The current tab.
    #
    getTab: =>
      @_current_tab

    # Assign the current tag with the given tab
    #
    # @param tab [String] A tab to assign to the current tab.
    #
    setTab: (tab) =>
      @_current_tab = tab

    # Check the current tab is equal to the given tab or
    # in the given tab array.
    #
    # @param tab [String, Array<String>] A tab or an array of tabs to check.
    # @return [Boolean] true if matched, otherwise false.
    #
    isTab: (tab) =>
      if tab instanceof Array
        (@_current_tab in tab)
      else
        (tab == @_current_tab)

    # Switch to the given tab
    #
    # @param tab [String] The tab you want to switch to.
    #
    switch: (tab) =>
      if @isTab(tab)
        @reset()
      else
        @setTab(tab)

    # The tab switcher constructor
    #
    # @param tab [String] The initial tab. The default value is "none" if
    #   no tab is given.
    # @return [TabSwitcher]
    #
    constructor: (tab = @DEFAULT_TAB) ->
      @_init_tab = tab
      @setTab(tab)

  return TabSwitcher
