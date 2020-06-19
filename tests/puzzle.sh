#!/bin/bash
# evaluate performance in test positions

error()
{
  echo "puzzle testing failed on line $1"
  exit 1
}
trap 'error ${LINENO}' ERR

echo "puzzle testing started"

cat << EOF > puzzle.exp
   set timeout 10
   spawn python3 ../tests/chess-artist/chess_artist.py --infile ../tests/chess-artist/EPD/wacnew.epd --outfile wacnew_result.txt --enginefile ./stockfish --eval search --job test
   expect eof
EOF

expect puzzle.exp # > /dev/null

rm puzzle.exp

echo "puzzle testing OK"
