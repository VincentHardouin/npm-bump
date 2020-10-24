# NPM-BUMP 

npm-bump is a Bash Script for bump npm version 

## Installation 

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

## Features 
- Script available globally 
- Verify outdated package 
- Use `npm install` instead of `npm update`
- Try to install latest version of each package
- Run `npm test` after each `npm install` for verify exit code
- Create bump commit for each package 