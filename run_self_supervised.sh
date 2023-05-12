#!/bin/bash

if [ "$SHELL" = "/bin/bash" ];then
    echo "your login shell is the bash "
    echo "SHELL is : $SHELL"
else 
    echo "your login shell is not bash but $SHELL"
fi

# TGN-attn: self-supervised learning on the wikipedia dataset
python -u train_self_supervised.py --data wikipedia --gpu 1 --use_memory --prefix tgn-attn --n_runs 10

# TGN-attn-reddit: self-supervised learning on the reddit dataset
python -u train_self_supervised.py --data reddit --gpu 1 --use_memory --prefix tgn-attn-reddit --n_runs 10
