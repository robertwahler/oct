@announce
Feature: Options via a command line interface (CLI)

  As an interactive user or automated script
  The application should accept options on the command line
  These options should override hard coded defaults 
  In order to configure options

  Scenario: Version info
    When I run "oct --version"
    Then the exit status should be 0
    And I should see matching "oct, version ([\d]+\.[\d]+\.[\d]+$)"

  Scenario: Help
    When I run "oct --help"
    Then the exit status should be 0
    And I should see matching: 
      """
      .*
      
        Usage: .* \[options\]
      
      .*

      Options:
      .*
          -v, --\[no-\]verbose               Run verbosely
      """

  Scenario: No command line options
    When I run "oct"
    Then the exit status should be 1
    And I should see matching: 
      """
      .*
      
        Usage: .*$
      .*
      ^.* --help for more information
      """

  Scenario: Invalid option
    When I run "oct --non-existing-option"
    Then the exit status should be 1
    And I should see matching: 
      """
      ^.* invalid option: --non-existing-option
      ^.* --help for more information

      """
