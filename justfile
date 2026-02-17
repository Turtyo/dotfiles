stow-all:
  for d in $(ls -d */); do \
    echo "$d"; \
  done
