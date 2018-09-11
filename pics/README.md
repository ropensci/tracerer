# `pics`

`tracerer` pictures.

## How did you convert the fuzzy white background to one single color?

```
convert ant.png -fuzz 15% -fill white -opaque white ant_mono_background.png
convert ant_mono_background.png -background white -alpha remove ant_mono_background_2.png
```