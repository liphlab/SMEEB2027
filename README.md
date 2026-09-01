# SMEEB 2027 — conference website

Website for **Stochastic Models and Experiments in Ecology and Biology**,
Venice, Italy, 26–28 May 2027.

Built with [Jekyll](https://jekyllrb.com/) (based on the CloudCannon *Frisco*
template, carried over from the 2021 and 2024 editions) and published with
GitHub Pages.

---

## How to change things

You almost never need to touch HTML structure. Here is where each thing lives.

| I want to change… | Edit this |
| --- | --- |
| Dates, location, intro text, topics, key dates, sponsors | `index.html` |
| Registration / abstract submission text and links | `registration.html` |
| Venue address, travel, hotels, restaurants | `venue.html` |
| Timetable and abstract booklet | `program.html` |
| Contact email | `registration.html`, `organizers.html`, `_config.yml` |
| The menu at the top of every page | `_data/navigation.yml` |
| The links at the bottom of every page | `_data/footer.yml` |
| The main accent colour of the site | `$brand-color` in `_sass/variables.scss` |

### Adding an invited speaker

Create one file `_speakers/Surname.md` containing exactly this:

```
---
name: Firstname Surname
position: Their Institution
website: "https://their-homepage.example"
image_path: /images/speakers/surname.jpg
---
```

Then put their photo at `images/speakers/surname.jpg`. Square photos look best;
resize to about 600×600 px before adding it. The speakers page builds itself
from these files — no HTML needed. Same idea for `_organizers/`.

### Adding a PDF or an image

Put PDFs and schedule images in `files/`, photos in `images/`, then link to them
as `{{ site.baseurl }}/files/yourfile.pdf`. **Always write `{{ site.baseurl }}`
in front of the path** — without it the link breaks once the site is online.

### Keep media small

Web pages should stay light: aim for **under 500 KB** per image. To shrink one:

```
convert big-photo.jpg -resize '2000x2000>' -strip -quality 82 web-photo.jpg
```

---

## Previewing the site on your own computer

One-time setup (needs `sudo` once, to let Ruby build its packages):

```
sudo apt install ruby-dev build-essential zlib1g-dev
bundle3.2 install
```

Then, every time you want to work on the site:

```
bundle3.2 exec jekyll serve --baseurl ""
```

(On this machine the command is `bundle3.2`, not plain `bundle` — that is just
how Debian/Ubuntu names it. On other machines `bundle` may work instead.)

and open <http://localhost:4000> in your browser. Leave it running: every time
you save a file, refresh the browser and you see the change immediately. Press
`Ctrl+C` to stop.

The `--baseurl ""` is needed only locally. Online, GitHub Pages automatically
sets the base URL to the repository name.

---

## Publishing

The site is published from this repository by GitHub Pages. Pushing to the
default branch rebuilds the live site within a minute or two. If a build fails,
GitHub emails the person who pushed.

---

## Still to be filled in

Search the project for `TODO 2027` to find every placeholder left in the pages:

```
grep -rn "TODO 2027" --include=*.html .
```

Open items: exact venue and address, map embed, abstract submission link and
deadline, registration link and conditions, invited speakers, program and
abstract booklet, accommodation and restaurant lists, social dinner, and the
final list of sponsors and funders.
