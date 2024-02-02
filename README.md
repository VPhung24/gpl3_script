# [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html#license-text) Script

tldr; typescript gpl v3.0 header and LICENSE file generate script

## Description

This script is used to add the GNU General Public License v3.0 to a directory and add the header to all typescript files in a directory.

- No need to edit any of the files. Script will request the necessary information and fill in appropriate fields.
- Header will be added to the top of all typescript files (excluding node_module directories and directories starting with "."). Does not check if header already exists.
- LICENSE file will be added to the directory if it does not already exist.

Feel free to edit the script to fit your needs.

## Usage

### Add LICENSE and header to repo

```zsh
./add-gpl-v3.0.zsh  <directory>
```

### Add LICENSE to repo

```zsh
./add-gpl-v3.0-license.zsh  <directory>
```

### Add header to directory

```zsh
./add-gpl-v3.0-header.zsh <directory>
```
