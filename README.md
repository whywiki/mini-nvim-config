# nvim-docker

Neovim config for a ROS2 Docker container.

## Requirements

Install these in your container before launching Neovim:

```bash
sudo apt install -y git gcc g++ make clangd ripgrep
pip3 install pyright
```

## Installation

```bash
git clone <your-repo-url> ~/.config/nvim
nvim
```

Lazy.nvim will bootstrap itself and install all plugins on first launch.

## ROS2: clangd setup

For C++ intellisense to work, generate `compile_commands.json`:

```bash
colcon build --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -s build/compile_commands.json compile_commands.json
```
