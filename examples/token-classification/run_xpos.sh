if ! [ -f ./dev.txt ]; then
  echo "Please place the PTB XPOS dataset dev split at ./dev.txt"
  exit 1
fi

if ! [ -f ./test.txt ]; then
  echo "Please place the PTB XPOS dataset test split at ./test.txt"
  exit 1
fi

if ! [ -f ./train.txt ]; then
  echo "Please place the PTB XPOS dataset test split at ./train.txt"
  exit 1
fi

export MAX_LENGTH=256
export BERT_MODEL=bert-base-uncased
export OUTPUT_DIR=xpostagger-model
export BATCH_SIZE=32
export NUM_EPOCHS=3
export SAVE_STEPS=750
export SEED=1

python3 run_ner.py \
--task_type XPOS \
--data_dir . \
--model_name_or_path $BERT_MODEL \
--output_dir $OUTPUT_DIR \
--max_seq_length  $MAX_LENGTH \
--num_train_epochs $NUM_EPOCHS \
--per_gpu_train_batch_size $BATCH_SIZE \
--save_steps $SAVE_STEPS \
--seed $SEED \
--do_train \
--do_eval \
--do_predict

