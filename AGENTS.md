# AGENTS.md

Guidance for AI coding agents (and humans) working in this repository.

## What this project is

Free, open (CC0) study materials for introductory computer science courses, written by Wiki Knights (UCF). All materials are **Pandoc markdown** files that are converted to HTML (primarily), PDF, and DOCX by the build scripts. When merged into `main`, CI builds the site and publishes it to GitHub Pages.

## Repository layout

- `src/` – All study materials. Each course folder (e.g. `intro-to-c/`, `cs1/`) has an `index.md` table of contents; each topic has its own subfolder.
- `doc/` – Contributor documentation: `writing-documents.md` (syntax), `style-guide.md` (content rules), `sample-file.md` (fully commented example), `extra-credits.md`. **Read these before writing or editing materials.**
- `build/` – Build scripts (see below).
- `templates/` – **Git submodule** ([pandoc-templates](https://github.com/wikiknights/pandoc-templates)) with the pandoc style templates. Must be checked out for builds to work.
- `docker/` – Containerized build environment (recommended).
- `static/` – Shared assets (logo, favicon). Topic-specific images live next to the topic.
- `out/` – Build output (gitignored; never commit `*.html`, `*.pdf`, `*.docx`, or `out/`).

## Building and verifying changes

The standard loop is: make markdown changes → build → inspect the generated output (and pandoc warnings) → repeat.

### Docker (recommended; matches the pinned environment)

```sh
cd docker
docker compose up --build   # runs a watch loop; rebuilds changed files every 5s
# view the site at http://localhost:8080
docker compose down --rmi all --volumes   # when done
```

Notes:

- The container mounts the repo read-only at `/mnt/project` and writes output to `/mnt/output` (inside the container, not the repo). The HTTP server runs until the container is stopped.
- The compose file sets `platform: linux/amd64` because the image installs the amd64 pandoc `.deb`. On Apple Silicon this runs under emulation (slow first build) — **do not remove the platform line**.
- For a one-shot full build without the server, use the scripts directly (next section).

### Build scripts (manual)

Run from `build/` (or `bash build/<script>` from the root). Requires `pandoc` (CI pins 3.1.12.3) and the `templates/` submodule checked out.

- `build_all.sh [-csv]` – Build all `src/**/*.md` to `out/` (or `$OUTPUT_DIR`). `-c` only rebuilds changed files, `-v` verbose. This is what CI runs.
- `md_to_html.sh [-dhmp] [-m] [-o <file>] <file.md>` – Convert a single file: `-h` HTML, `-d` DOCX, `-p` PDF, `-m` run HTML through premailer (Webcourses-compatible). Default output: next to the input file.
- `auto_build_server.sh` – What the Docker image runs; needs `SERVER_PORT`.

There is no test suite; a clean build with no pandoc warnings and a visually correct rendered page **is** the verification.

## Writing conventions (Pandoc markdown, not GitHub-flavored)

Full details: [doc/writing-documents.md](doc/writing-documents.md) and [doc/sample-file.md](doc/sample-file.md). The essentials:

- **YAML front matter** at the top of each file: `title:`, `author:` (single name or a list), and `toc: false` to disable the TOC.
- **Practice questions** use numbered example lists: `@. Question text` (auto-renumbers as questions are added).
- **Code blocks**: use fenced blocks; add the `numberLines` class for line numbers — note the syntax change for attributes: ` ``` c ` vs ` ``` {.c .numberLines} `.
- **TOC control**: add the `unlisted` class to a heading (`# Heading {.unlisted}`) to hide it from the page TOC.
- **Practice pages are single pages**: each question is immediately followed by its answer in a raw HTML collapsible — there are no separate `-answers` files:

  ````
  @. What will this program print if executed?

    ``` c
    // question code
    ```

  <details>
    <summary>Answer</summary>

  **Answer:** `the output`

  </details>
  ````

- **Style rules** ([doc/style-guide.md](doc/style-guide.md)): keep material within its topic area, and prefer "evergreen" content (no links to external pages that may disappear; centralize external links in `src/index.md`).
- **Links**: write internal links as `.md` paths — the HTML build rewrites them to `.html` automatically.
- **Course TOCs**: when adding, removing, or renaming a page, update the course `index.md` that links to it.

## Prose style of the existing articles

The materials have a recognizable voice. If you generate new articles, match it: first **read 1–2 existing articles in the same topic folder** (and the course's `index.md`) and imitate their register. Observed traits:

- **Warm, direct, student-facing.** Second person ("you"), present tense, short paragraphs. The dominant voice (see `hello-world.md`, `pointers/`, `dma/`, and the practice answers) is enthusiastic and playful: rhetorical questions ("But wait! What's that `\n` at the end?"), light jokes and asides in parentheses ("(Spoiler: ...)", "*A wild global variable has appeared!*", "one of the *craziest* concepts in our toolkit"), and the occasional exclamation mark. Humor never overrides correctness — the technical explanation itself is precise.
- **A minority of files are drier** (e.g. `strings-intro.md`). That is acceptable — but never "de-personalize" an existing playful article, and never add playfulness to a dry one. **When editing, preserve the author's established voice; do not rewrite in a generic tone.** Front matter always carries the `author:`; keep it.
- **Structure**: a 1–3 sentence framing intro right after the front matter, then focused `##` sections, one idea each. Define a term before using it; foreshadow instead of requiring material that hasn't been taught ("you will learn more about later!") — per the [style guide](doc/style-guide.md) topic boundaries.
- **Show, don't just tell**: concepts are demonstrated with a small **complete, runnable** example (full `#include`s, `main()`, `return 0;`) followed by a `{.console}` block of its actual output, then a line-by-line or concept-by-concept breakdown.
- **C code style in examples**: 2-space indentation, opening braces on their own line (Allman), comments explaining non-obvious lines. The corpus varies file-to-file (some use 4 spaces); when editing existing code match the file, and use the 2-space/Allman majority style for new code.
- **Practice questions** are phrased conversationally and concretely ("What will this program print if executed?", "Is this program managing memory correctly? If not, how can it be fixed?") — usually a code block plus one or two pointed questions, sometimes with `**CHALLENGE:**`-tagged harder variants.

Example of the target shape (abridged from `hello-world.md` — markdown source as it should be written):

    It really works! But what does it all mean? Let's break each line down and find out!

    ``` c
    int main(void)
    {
      printf("Hello, world!\n");

      return 0;
    }
    ```

    ``` {.console}
    prompt> (I type the command to run the program...)
    Hello, world!
    prompt>
    ```

    But wait! What's that `\n` at the end? This is called a *newline character*, and states to print... a new line!

## Pandoc pitfalls (learned the hard way)

- **Raw HTML is output-format dependent.** `<details>`/`<summary>` passes through in HTML output, but pandoc **strips raw HTML in PDF/DOCX** — the answer text remains, simply uncollapsed. Never write content that only makes sense when collapsed.
- **Indentation matters.** A code fence indented 4+ spaces (or tab) at top level becomes an *indented code block*, and a blank line inside it does not end it — pandoc will swallow following content (including `</details>` tags) into the code listing. Keep top-level fences indented 0–3 spaces. (Inside list items, indentation is relative to the item.)
- **`---` is context-sensitive**: directly under a text line it is a setext heading underline; separated by a blank line it is a horizontal rule.
- **`@.` example lists** are pandoc-specific; they render as `<ol class="example">` in HTML.

## Git and process

- Branch from `main`, open a pull request. Build locally before requesting review.
- **Submodule workflow**: `templates/` changes are a two-repo flow — push to [pandoc-templates](https://github.com/wikiknights/pandoc-templates) first, then PR the pointer update here. Clone with `git clone --recurse-submodules`; if `templates/` is empty, run `git submodule update --init --recursive`.
- Do not commit build artifacts (`out/`, `*.html`, `*.pdf`, `*.docx` are gitignored) or editor/OS files.
- The GitHub Pages site is the live output; `main` is always published.
