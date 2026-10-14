# Contributing

This repository is public and open-source, as free as can be! While you can view to your heart's content, editing directly is restricted to members of [Wiki Knights](https://wikiknights.com), a student organization at the University of Central Florida. If you are such a member and want to make changes, let one of the club officers know and you will be added to the list of contributors.

Anyone, regardless of being a member, can also submit **pull requests** for new additions or changes! Anyone is also free to make forks or redistribute!

Looking for a place to start? See the [project board](https://github.com/orgs/wikiknights/projects/1/) for open areas to contribute. If you have a suggestion but don't want to work on it yourself, consider opening a [suggestion issue](https://github.com/wikiknights/cs-materials/issues/new?template=suggestions.yml) instead.

## Contents

- [Setting Up Your Environment](#setting-up-your-environment)
- [Building the Project](#building-the-project)
- [Writing Documents](#writing-documents)
- [Styling the Output](#styling-the-output)
- [Submitting Changes](#submitting-changes)

## Setting Up Your Environment

### New to Git or GitHub?

If you are new to using `git` or GitHub, the easiest way to make changes is by downloading the [GitHub Desktop client](https://desktop.github.com/), so you do not have to involve yourself with the command line and can get started relatively easily. For writing markdown and viewing the changes you make, [VS Code](https://code.visualstudio.com/) supports markdown natively.

### Cloning the Repository

This repository is set up with a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) for [pandoc-templates](https://github.com/wikiknights/pandoc-templates) in the `templates/` folder. These templates are used for style and formatting when pandoc is converting to (primarily) HTML. This can make development difficult and confusing, especially for users new to `git`, so the "Submodule Details" section below shows the commands to run for various common situations that you may experience.

To clone this repository, use `git clone --recurse-submodules` so that the pandoc-templates submodule is included:

``` sh
git clone --recurse-submodules https://github.com/wikiknights/cs-materials
```

**To make working in submodules automatic, use the following command to set this:** `git config --global submodule.recurse true`

The only other step needed to work with the repository is to initially clone with `--recurse-submodules`, as shown above. (`git clone` is the only command that the previous setting does not apply to.)

#### Post-Checkout Hook

You may also want to add a post-checkout hook in order to auto-checkout any submodules. **This hook is recommended for contributors that do not intend to make any modifications to templates.** Since there are sometimes differences in the submodules between branches of the supermodule, this can cause some editors and git clients to believe there are changes to the submodule. This may not necessarily be true, but is instead a byproduct of switching branches.

Post-checkout hook (`.git/hooks/post-checkout`):

``` sh
#!/bin/sh
#
# Hook to automatically checkout any submodules once checking out a branch.

git submodule foreach 'git checkout $sha1'
```

This is not added to the repository because it may create unwanted behavior if any work is being done to a submodule.

#### Submodule Details

- If there are changes to the pandoc-templates submodule not yet reflected in the main repository, these can be merged in with `git submodule update --remote`.
- If this repository has already been cloned without submodules, or changes have been (remotely) made to submodules that are not yet reflected on your local instance, use `git submodule update --init --recursive` to initialize (if necessary) and update your local instance of the submodules. You can also use `git pull --recurse-submodules`.
- To make changes to the pandoc-templates submodule, enter into the `./templates` directory and checkout the default branch with `git checkout master`. You can then make changes in this directory as if it were a separate project. (If starting a pull request, you could checkout to a different branch.) Pushing changes is done as normal with `git push`.

(See the [Git Book on submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) for more details when using submodules.)

## Building the Project

When changes are merged into `main`, the project is automatically built to HTML and published. For local development, you can build the project either with Docker or with the build scripts directly.

*Note:* The build scripts are expected to run in a Unix-type environment.

### Docker (Recommended)

The `docker/` folder provides a consistent build environment without requiring any operating-system-dependent packages, so it is the easiest way to build the project locally. For full instructions on getting started with Docker, see [the official Docker documentation](https://docs.docker.com/get-docker/).

``` sh
cd docker
docker compose up --build
```

Once the process is finished, you should see the project being converted to the publishing format (HTML). You can view the site at: http://localhost:8080

To stop the build environment, use Ctrl+C. To remove the environment entirely, run:

``` sh
docker compose down --rmi all --volumes
```

See [docker/docker.md](docker/docker.md) for more technical details.

### Build Scripts (Manual)

The scripts are provided as a manual alternative to the Docker process. (The Docker environment uses these same scripts internally.) All scripts can be found in the `build/` folder. To use the scripts, ensure that you have `pandoc` (and possible additional programs needed for the PDF output) set up.

**Required Software and Dependencies:**
- `pandoc` >= 3.0 (Visit your package manager)
- For PDF export: LaTeX libraries - `texlive-core`, `texlive-latexextra` (Visit your package manager)
- The font "Fira Code" must be installed for PDF output. ([Installation](https://github.com/tonsky/FiraCode/wiki/Installing))

**Optional Software:**
- Python 3 library: `premailer` (Use `pip install premailer`)
    - This is only used when `premailer` is enabled with the `-m` flag when running `md_to_html.sh`.

**Scripts** (run from the `build/` folder):

- `md_to_html.sh` converts a single markdown file that you specify. By default, it produces HTML; use `-d`, `-p`, or `-h` to convert to DOCX, PDF, or HTML, `-m` to run the HTML output through premailer, and `-o <file>` to set the output location. (By default, output is saved next to the input file.)
    - To use it:
        - Open your command line into the folder that contains the script.
        - Run `./md_to_html.sh <markdown file name>`.
    - For more help, run `./md_to_html.sh`.
- `build_all.sh` compiles all .md files in the `src/` folder into HTML files with the same directory structure in the `out/` folder. Flags: `-c` only rebuilds files that have changed since the last build, `-s` suppresses output from the secondary build script, and `-v` shows all logs.
    - To use it:
        - Open your command line into the folder that contains the script.
        - Run `./build_all.sh`, adding any of the flags above as needed.
- `auto_build_server.sh` rebuilds any changed files on a set interval and hosts the `out/` folder on a local web server. It requires the `SERVER_PORT` environment variable to be set.
- `get_newer.sh` lists markdown files that are newer than their corresponding HTML output. This is used by `build_all.sh -c` and `auto_build_server.sh`, but can also be handy to run directly.

All conversions are handled by `pandoc` using the templates in `templates/` and the default options in `build/defaults.yaml`. `premailer` (when enabled) adjusts the HTML output from `pandoc` into a format that can be copy-pasted into Webcourses without losing its formatting (Webcourses does not support the `<style>` tag).

## Writing Documents

Each document is written as a markdown file, which is then converted to other formats via a build script. The guides below, found in the `doc/` folder, explain how the materials in this project are written:

- [Writing Documents](doc/writing-documents.md): The markdown syntax used by this project, including the pandoc extensions that give documents additional flexibility.
- [Style Guide](doc/style-guide.md): Guidelines for what should/shouldn't be in a document, and how to arrange content.
- [Sample File](doc/sample-file.md): A fully commented example document demonstrating everything, a great starting point for new documents.
- [Extra Credits](doc/extra-credits.md): A centralized record of external sources and credits for the materials.

## Styling the Output

The style and formatting of the exports is handled by the `templates/` submodule ([pandoc-templates](https://github.com/wikiknights/pandoc-templates)) and the global defaults in `build/defaults.yaml`. See the [pandoc-templates wiki](https://github.com/wikiknights/pandoc-templates/wiki) for more information on how to modify the formatting of HTML/PDF/DOCX exports.

## Submitting Changes

1. Create a new branch from `main` (or from the branch you are working off of).
2. Make your changes, and build the output locally to make sure everything looks right.
3. Push your branch and open a pull request.

If your changes involve the `templates/` submodule, you will be making changes in two repositories: push your template changes to [pandoc-templates](https://github.com/wikiknights/pandoc-templates) and open a pull request there, then open a pull request in this repository that updates the submodule pointer.
