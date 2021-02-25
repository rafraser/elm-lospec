import argparse
import requests
import json
import time

from elm_builder import generate_elm_file


def lospec_url(page):
    return f"https://lospec.com/palette-list/load?colorNumberFilterType=any&page={page}&tag=&sortingType=newest"


def palette_url_from_slug(slug):
    return f"https://lospec.com/palette-list/{slug}"


def scrape_palettes():
    """Scrape all palettes

    Returns:
        Dictionary of Lospec palettes.
        Each palette will have the colors, tags, createdAt, authorName, and description
    """
    current_page = 1
    all_palettes = {}

    # Hard cutoff of 200 pages in case something goes wrong
    # if there's ever more than 200 pages of palettes, change this number
    while current_page < 200:
        req = requests.get(lospec_url(current_page))
        if req.status_code != 200:
            break

        try:
            # Load page data
            # If no palettes are on this page, we've probably reached the last page
            page_data = req.json()
            page_palettes = page_data.get("palettes")
            if not page_palettes or len(page_palettes) < 1:
                break

            # Save each palette on this page
            for palette in page_palettes:
                slug = palette.get("slug")
                # Remove duplicate tags, clear whitespace
                tidy_tags = sorted(
                    list(set([tag.strip() for tag in palette.get("tags", [])]))
                )
                all_palettes[slug] = {
                    "title": palette.get("title"),
                    "description": palette.get("description"),
                    "colors": palette.get("colorsArray"),
                    "tags": tidy_tags,
                    "createdAt": palette.get("createdAt"),
                    "authorName": palette.get("user", {}).get("name"),
                    "url": palette_url_from_slug(slug),
                }
        except:
            break

        current_page += 1

    return all_palettes


def save_palettes_to_json(path, palettes):
    """Save a dictionary of palettes to a specified .json file

    Args:
        path (str): File path to save .json to. Requires read and write permissions.
        palettes: Dictionary of palettes to save
    """
    try:
        f = open(path, "r+")

        # If the file already exists, check that we're not decreasing the number of palettes
        existing_palettes = json.load(f)
        if len(existing_palettes) >= len(palettes):
            return
        f.seek(0)
    except:
        f = open(path, "w")

    # Write to file
    json.dump(palettes, f, indent=4)
    f.close()


def main(args):
    if args.j and args.e:
        # Scrape palettes and build Elm
        all_palettes = scrape_palettes()
        save_palettes_to_json(args.json, all_palettes)
        generate_elm_file(args.elm, all_palettes)
    elif args.j and not args.e:
        # Scrape palettes, don't build Elm
        all_palettes = scrape_palettes()
        save_palettes_to_json(args.json, all_palettes)
    elif args.e and not args.j:
        # Load palettes list from last .json, and build Elm
        with open(args.json, "r") as f:
            all_palettes = json.load(f)
            generate_elm_file(args.elm, all_palettes)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-j", action="store_true", help="Save scraped palettes to a .json file?"
    )
    parser.add_argument(
        "-e", action="store_true", help="Generate a .elm file for scraped palettes?"
    )
    parser.add_argument(
        "--json", default="scraped_palettes.json", help="Output path for scraped .json"
    )
    parser.add_argument(
        "--elm", default="src/PaletteList.elm", help="Output path for generated .json"
    )
    main(parser.parse_args())
