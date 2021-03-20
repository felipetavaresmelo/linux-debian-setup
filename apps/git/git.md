
## Configurações globais

```sh
git config --global user.email "felipetavaresmelo@gmail.com"
git config --global user.name "Felipe Tavares de Melo"
```

## …or create a new repository on the command line

```sh
echo "# Angular" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:felipetavaresmelo/angular.git
git push -u origin main
```

## …or push an existing repository from the command line

```sh
git remote add origin git@github.com:felipetavaresmelo/angular.git
git branch -M main
git push -u origin main
```