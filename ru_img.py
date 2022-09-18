#!/usr/bin/env python3

from PIL import Image
import os, sys, shutil
import argparse

def resize(path, size):
    f, e = os.path.splitext(path)
    out_path = os.path.basename(f) + f'_{size}.jpg'
    shutil.copy(path, out_path)
    im = Image.open(out_path)
    imResize = im.thumbnail([size, size], Image.Resampling.LANCZOS)
    return out_path

if __name__ == '__main__':
    psr = argparse.ArgumentParser(description='resize and upload')
    psr.add_argument('-r', dest='resize_size', type=int, default=-1,
                        help='set positive size to make thumbnail')
    psr.add_argument('-u', dest='upload', type=bool, default=False,
                        help='upload image to gcs')
    psr.add_argument('file', help='image file to resize or upload')
    args = psr.parse_args()

    r = ""
    if args.resize_size > 0:
        r = resize(args.file, args.resize_size)
        print(f'made {r}')

    if args.upload:
        u, m = "", ""
        if r:
            u, b = r, r
        else:
            u, b = args.file, os.path.basename(args.file)
        
        os.system(f'gsutil cp {u} gs://homin-dev_asset/blog/img/{b}')
        print(f'use ![{b}](https://homin.dev/asset/blog/img/{b})')
    