@announce
Feature: Octal file listing

  As an interactive user or automated script
  The application should accept a list of files on the command line
  and return a sorted listing of files with octal file permissions
  because working with chmod is easier in octal

  Background: A bunch of files
    Given an empty file named "file2.txt"
    And file "file2.txt" is chmod 0644
    Given an empty file named "file1.txt"
    And file "file1.txt" is chmod 0644

  Scenario: No files on the command line
    When I run "oct"
    Then the exit status should be 0
    And the output should contain:
      """
      0644 file1.txt
      0644 file2.txt
      """

  Scenario: Files on the command line
    When I run "oct file1*"
    Then the exit status should be 0
    And the output should contain:
      """
      0644 file1.txt
      """
    And the output should not contain:
      """
      0644 file2.txt
      """
