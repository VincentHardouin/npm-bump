# NPM-BUMP 

npm-bump is a Bash Script for bump npm version.

It exists because tasks of update packages are frequent and boring.
This script bump versions of packages that have no tests issues.

https://user-images.githubusercontent.com/26384707/163569189-ea8f4706-76e4-4712-a87d-25d087410c10.mp4

## Installation 

### With [Homebrew](https://brew.sh/)
On OS X, you can install npm-bump via [Homebrew](https://brew.sh/):
```bash 
brew tap vincenthardouin/npm-bump
brew install npm-bump
```

### With make

```bash
make install
```

### Classic method
1. Clone repository 
```bash
git clone git@github.com:VincentHardouin/npm-bump.git
```

2. Go in directory
```bash
cd npm-bump
```

3. Add permission
```bash
chmod 777 npm-bump
```

4. Create symlink
```bash
ln -sf ${PWD}/npm-bump /usr/local/bin
```

## Usage 

On directory who have `package.json` and `package-lock.json` 
Run : 
```bash
npm-bump
```
And wait :hourglass: with :coffee:

### Optional arguments

```bash
  -h, --help                show this help message and exit
  -m, --markdown            display updated packages in markdown table
  -e, --exclude             exclude package name seprated by a comma (e.g -e lodash,mocha)
  -nt, --no-test            does not run test command when update package
``` 

## Features 
- Script available globally 
- Verify outdated package 
- Use `npm install` instead of `npm update`
- Try to install latest version of each package
- Run `npm test` after each `npm install` to verify exit code
- Create bump commit for each package 
- Show updated packages and packages not updated at the end
