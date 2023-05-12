#!/bin/bash

if [ "$SHELL" = "/bin/bash" ];then
    echo "your login shell is the bash "
    echo "SHELL is : $SHELL"
else 
    echo "your login shell is not bash but $SHELL"
fi

# TGN-attn: Supervised learning on the wikipedia dataset
python -u train_supervised.py --data wikipedia --gpu 2 --use_memory --prefix tgn-attn-wikipedia --n_runs 10 &

# TGN-attn-reddit: Supervised learning on the reddit dataset
python -u train_supervised.py --data reddit --gpu 2 --use_memory --prefix tgn-attn-reddit --n_runs 10