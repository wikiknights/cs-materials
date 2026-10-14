# Supplementary Computer Science Materials

Free, open study materials for introductory computer science courses, developed by [Wiki Knights](https://wikiknights.com), a student organization at the University of Central Florida.

All materials are written in [Pandoc markdown](https://pandoc.org/MANUAL.html#pandocs-markdown) and converted to HTML, PDF, and DOCX via the project's build scripts. When merged into `main`, the materials are automatically built and published as a website.

## Table of Contents

- [Intro to C Programming](src/intro-to-c/index.md)
- [Computer Science 1](src/cs1/index.md)

## Repository Structure

- `src/` – All of the study materials. Each folder contains the resources for that specific topic, and each course folder has an `index.md` that serves as a table of contents, sorted (roughly) by the order in which the topics are taught in class.
- `static/` – Assets (like images, logos, and the favicon) that are shared broadly across all materials. Images specific to a topic should be located in the same or a nearby directory as that topic.
- `build/` – Scripts that convert the markdown in `src/` into other formats.
- `templates/` – A [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) of [pandoc-templates](https://github.com/wikiknights/pandoc-templates), containing the style templates that pandoc uses when exporting.
- `docker/` – A containerized build environment, so the project can be built without installing any system dependencies. See [docker/docker.md](docker/docker.md).
- `doc/` – Contributor documentation and writing guides. See [doc/README.md](doc/README.md).

## Documentation

- [CONTRIBUTING.md](CONTRIBUTING.md) – How to set up your environment and contribute to the project.
- [doc/](doc/README.md) – Guides for writing materials: document syntax, style, a sample file, and external credits.

## License

This project is licensed under [CC0 1.0 Universal](LICENSE) – do with it as you please!
