# Gateway service
Multi domain proxy with SSL port
![](./infrastructure.png)

### How to add new feature?
1) Create feature branch feature/**
2) Merge feature branch into develop branch
3) Create release branch from develop
4) Create tag from release branch `git tag -a 1.1.5 -m "Release 1.1.5"`
5) Push tag `git push origin 1.1.5`
6) Deploy tag
7) Merge release branch into master branch