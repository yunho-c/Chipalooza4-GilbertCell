# Chipalooza4-GilbertCell

900 MHz Gilbert-cell mixer project for Chipalooza Challenge #4.

- [`Proposal/`](Proposal/) mirrors the complete source of the [Overleaf project](https://www.overleaf.com/project/6afb93214ffec2507e7e0306). Its main LaTeX document is [`proposal.tex`](Proposal/proposal.tex); it also contains `draft-1.md`, instructions, links, and the reference PDF.
- [`test-equipment.md`](Proposal/test-equipment.md) is a brief internal reference for Georgia Tech makerspace equipment, linked inventories, and unresolved measurement requirements. The test plan is in the proposal; this note is not a submission-ready Rule 6.6 attachment.
- [`Proposal References/`](Proposal%20References/) contains reference proposals.
- [`rules-regulations.md`](rules-regulations.md) contains the challenge rules and regulations.

## Build the proposal

[`proposal.tex`](Proposal/proposal.tex) assembles the document with `\input`.
Shared formatting is in [`preamble.tex`](Proposal/preamble.tex), and the title and
section bodies are in [`sections/`](Proposal/sections/). Edit the corresponding
section file and compile the root document from `Proposal/`:

```sh
cd Proposal
tectonic proposal.tex
```

## Sync with Overleaf

The Overleaf project is connected through a Git subtree at `Proposal/`.
Synchronization runs on demand; it does not run automatically in the background.
The script also works in fresh clones without configuring an extra Git remote.
Overleaf Git access and `git subtree` are required. If Git requests a password,
use an existing Overleaf Git authentication token. Keep credentials out of this repository.

To bring the latest Overleaf changes into this repository, start with a clean
working tree and run:

```sh
./scripts/sync-overleaf.sh pull
git push origin main
```

To send local proposal edits back to Overleaf, commit them first, merge any
concurrent Overleaf edits, and then push:

```sh
git add Proposal/
git commit -m "Update proposal"
./scripts/sync-overleaf.sh pull
./scripts/sync-overleaf.sh push
git push origin main
```

If a pull reports conflicts, resolve the files in `Proposal/` and commit the
merge before continuing. Pushes never force-overwrite Overleaf history.
Only files under `Proposal/` are sent to Overleaf.
