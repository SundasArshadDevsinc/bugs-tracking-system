# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  console.log("CoffeeScript code is running...")
  # Select the Bug Type dropdown
  bugTypeDropdown = $('#bug_bug_type')

  # Select the Bug Status dropdown
  bugStatusDropdown = $('#bug_bug_status')

  # Define the options for Bug Status based on Bug Type
  bugTypeOptions =
    'bug': ['new_bug', 'started', 'resolved']
    'feature': ['new_feature', 'started', 'completed']

  # Function to update Bug Status options
  updateBugStatusOptions = ->
    
    selectedBugType = bugTypeDropdown.val()
    options = bugTypeOptions[selectedBugType] || []

    # Clear existing options
    bugStatusDropdown.empty()

    # Add new options
    for option in options
      bugStatusDropdown.append($('<option>', {
        value: option,
        text: option
      }))

  # Initially update the Bug Status options based on the default selected Bug Type
  updateBugStatusOptions()

  # Listen for changes in the Bug Type dropdown and update Bug Status options accordingly
  bugTypeDropdown.change ->
    updateBugStatusOptions()
