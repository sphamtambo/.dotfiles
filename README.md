# Dot Files Managed by GNU Stow

These dot files are managed using [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager. GNU Stow helps organize and maintain configuration files in a centralized location while allowing them to be easily symlinked to their respective locations.

## Usage

1. **Clone this repository**:

    ```bash
    git clone https://github.com/sphamtambo/.dotfiles.git
    ```

2. **Navigate to the repository directory**:

    ```bash
    cd .dotfiles
    ```

3. **Install GNU Stow if not already installed**:

    On Debian/Ubuntu:

    ```bash
    sudo apt-get install stow
    ```

    On macOS (using Homebrew):

    ```bash
    brew install stow
    ```

4. **Preview changes without making any changes**:

    The `--adapt` flag tells Stow to update existing symlinks to match the ones specified in the configuration files. If you want to see the changes that might happen without actually applying them, you can use the `-nvt` flag:

    ```bash
    stow --adapt -nvt ~ bash
    ```

    This will only show the changes that might occur without making any actual changes.

5. **Choose the configuration you want to install**:

    For example, to install the configuration for `bash`, you can run:

    ```bash
    stow --adapt -vt ~ bash
    ```

    This will symlink the `.bashrc` `.bash_aliases`, and `.profile` files from the `bash` directory to your home directory.

6. **Customize configurations**:

    Feel free to customize the configurations to your preference by editing the files in the respective directories.

7. **Uninstall configurations**:

    To preview changes without making any on configurations installed by GNU Stow, use the `-nvDt` option:

    ```bash
    stow -nvDt ~ bash
    ```

    To remove configurations installed by GNU Stow, use the `-vDt` option:

    ```bash
    stow -vDt ~ bash
    ```

    This will remove the symlinks created by GNU Stow for the `bash` configuration.

## Contributing

Contributions are welcome! If you have improvements or additional configurations to share, feel free to open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
