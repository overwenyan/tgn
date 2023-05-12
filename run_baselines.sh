#!/bin/bash

if [ "$SHELL" = "/bin/bash" ];then
    echo "your login shell is the bash "
    echo "SHELL is : $SHELL"
    echo "run baselines"
else 
    echo "your login shell is not bash but $SHELL"
fi

### Wikipedia Self-supervised

# Jodie
python train_self_supervised.py --use_memory --memory_updater rnn --embedding_module time --prefix jodie_rnn --n_runs 10

# DyRep
python train_self_supervised.py --use_memory --memory_updater rnn --dyrep --use_destination_embedding_in_message --prefix dyrep_rnn --n_runs 10


### Reddit Self-supervised

# Jodie
python train_self_supervised.py -d reddit --use_memory --memory_updater rnn --embedding_module time --prefix jodie_rnn_reddit --n_runs 10

# DyRep
python train_self_supervised.py -d reddit --use_memory --memory_updater rnn --dyrep --use_destination_embedding_in_message --prefix dyrep_rnn_reddit --n_runs 10


### Wikipedia Supervised

# Jodie
python train_supervised.py --use_memory --memory_updater rnn --embedding_module time --prefix jodie_rnn --n_runs 10

# DyRep
python train_supervised.py --use_memory --memory_updater rnn --dyrep --use_destination_embedding_in_message --prefix dyrep_rnn --n_runs 10


### Reddit Supervised

# Jodie
python train_supervised.py -d reddit --use_memory --memory_updater rnn --embedding_module time --prefix jodie_rnn_reddit --n_runs 10

# DyRep
python train_supervised.py -d reddit --use_memory --memory_updater rnn  --dyrep --use_destination_embedding_in_message --prefix dyrep_rnn_reddit --n_runs 10