#!/bin/bash
echo "Press [CTRL-C] to stop..."

while :
do
  echo "Simulating another game..."
  bundle exec rake crude_game:sox_vs_yanks | grep -B 10 'flexible line scores'
done
