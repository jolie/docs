# The Jolie Documentation repository

This repository manages the Jolie documentation at <https://docs.jolie-lang.org/>.

If you want to update the documentation, **this is not the repository that you are looking for**. You have to update the branch of this repository for the relevant version of Jolie, e.g., for Jolie versions `1.10.x`, you have to update the branch `v1.10.x`.

# How to contribute to the documentation

## Creating a new tutorial
- Define a branch name that follows this guideline `tutorials/new/short-tutorial-name`
- Actions to take in repo `jolie/examples` 
  - Create a branch with the name `tutorials/new/short-tutorial-name`
  - Checkout branch `tutorials/new/short-tutorial-name`
  - Go to folder `examples/v1.10.x/tutorials/`
  - Create a directory with the short name of the tutorial `mkdir short-tutorial-name`
  - Go to folder `examples/v1.10.x/tutorials/short-tutorial-name`
  - Create all the files necessary for the tutorial
  - Commit
- Actions to take in repo `jolie/docs` 
  - Checkout branch `v.1.10.x`
  - Starting from this branch create a new branch `tutorials/new/short-tutorial-name`
  - Checkout branch `tutorials/new/short-tutorial-name`
  - Go to folder `docs/web/tutorials/`
  - Create a directory with the short name of the tutorial `mkdir short-tutorial-name`
  - Go to folder `docs/web/tutorials/short-tutorial-name`
  - Create file `README.md` as starting file for the tutorial. Start to write down the tutorial in this file
    - Remember to add links to the examples previously created in `examples/v1.10.x/tutorials/short-tutorial-name`
    - if you need to add links to other existing pages of the docs, please insert the URL of the page, not the path
    - If you need to add images:
      - Go into folder `docs/src/images/`
      - Select a .svg file which is close to the diagram you want to create
      - Open the file with the open version of [inkscape](https://inkscape.org/)  
      - Copy the file into a new file, giving it a new filename 
      - Close the file and open the new one, strating to editing it as you prefer
        - Remember to use font `Segoe Print` for comments
        - Remember to use tool `free hand lines` (setting bevel effect around 50) for tracing arrows for connecting comments and drawings
        - Remember to use squared lines for connecting microservices together
      - Once edited:
        - Save the .svg file into folder `docs/src/images/` (it is the source)
        - Save the .png file into folder `docs/web/.gitbook/assets/`
        - Create a link in the doc to png file. Example of a link:
          - `![](https://raw.githubusercontent.com/jolie/docs/v1.10.x/web/.gitbook/assets/using_dependencies_01.png)`
  - Once edited the documentation, open file `docs/web/SUMMARY.md` and place the link of your tutorial under main item `Tutorial`. Tru to find a correct placement of the tutorial considering the fact the previous tutorials must give the minimal knowledge necessary to undertsand uor tutorialù
- Open a pull request


