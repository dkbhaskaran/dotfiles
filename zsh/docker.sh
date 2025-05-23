#!/bin/bash -x 

function drun() {
  # Ensure an image name is provided
  if [ -z "$2" ]; then
    echo "Usage: $0 <image_name> <container_name>"
    return
  fi

  IMAGE_NAME=$1
  CONTAINER_NAME=$2

  shift 2
  EXTRA_ARGS="$@"

  # Use image name to create a unique container name by appending a timestamp
  USERNAME=$(whoami)  # Get the current user's name

  echo docker run --gpus all -dit \
    -v "$HOME":"$HOME" \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    "$@" \
    --name "$CONTAINER_NAME" "$IMAGE_NAME"
  # Step 1: Run the container in detached mode using the provided image
  docker run --gpus all -dit \
    -v "$HOME":"$HOME" \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    "$@" \
    --name "$CONTAINER_NAME" "$IMAGE_NAME"

  # Step 2: Install required packages inside the container
  docker exec "$CONTAINER_NAME" bash -c "DEBIAN_FRONTEND=noninteractive apt update && apt install -y sudo zsh locales"

  # For function of vim
  docker exec "$CONTAINER_NAME" bash -c "DEBIAN_FRONTEND=noninteractive apt install -y git vim nodejs ripgrep"

  # Enable the UTF-8 locale
  docker exec -it $CONTAINER_NAME sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
  docker exec -it $CONTAINER_NAME locale-gen

  # Write locale settings manually
  docker exec -it $CONTAINER_NAME bash -c "echo 'LANG=en_US.UTF-8' > /etc/locale.conf"
  docker exec -it $CONTAINER_NAME bash -c "echo 'export LANG=en_US.UTF-8' >> /etc/profile"
  docker exec -it $CONTAINER_NAME bash -c "echo 'export LC_ALL=en_US.UTF-8' >> /etc/profile"

  # Set LANG and LC_ALL for current session
  docker exec -it $CONTAINER_NAME bash -c "export LANG=en_US.UTF-8 && export LC_ALL=en_US.UTF-8"

  # Step 3: Create a non-root user with sudo access (current user)
  docker exec "$CONTAINER_NAME" bash -c "useradd -u `id -u` -g `id -g` -ms /bin/bash $USERNAME"
  docker exec "$CONTAINER_NAME" bash -c "echo '$USERNAME ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"
  docker exec "$CONTAINER_NAME" bash -c "chsh -s /usr/bin/zsh $USERNAME"

  # Final message
  echo "✅ Container setup complete. You can now enter as $USERNAME:"
}

function dexec() {
  if [ -z "$1" ]; then
    echo "Usage: $0 <container_name>"
    return
  fi

  CONTAINER_NAME=$1

  docker exec -it $CONTAINER_NAME su - $USERNAME
}

function drm() {
  if [ -z "$1" ]; then
    echo "Usage: $0 <container_name>"
    return
  fi

  CONTAINER_NAME=$1
  docker rm -f $CONTAINER_NAME
}
