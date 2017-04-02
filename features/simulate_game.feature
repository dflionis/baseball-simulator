Feature: Simulate Game
As an end user
I want to be able to simulate a baseball game
So that I can ultimately play a full season and track stats

Scenario: Simulating a Yankees/Red Sox Game
  Given Rake Tasks are available
  And the Yankees and Red Sox rosters are loaded
  When I simulate a game between the Yankees and Red Sox
  Then the game should play itself until completion
