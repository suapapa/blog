#!/usr/bin/env python3

import os, sys
import argparse

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
        f, e = os.path.splitext(args.file)
        r = os.path.basename(f) + f'_{args.resize_size}.jpg'
        os.system(f'convert {args.file} -resize {args.resize_size} {r}')
        print(f'made {r}')

    if args.upload:
        u, m = "", ""
        if r:
            u, b = r, r
        else:
            u, b = args.file, os.path.basename(args.file)
        
        os.system(f'gsutil cp {u} gs://homin-dev_asset/blog/img/{b}')
        print(f'use ![{b}](https://homin.dev/asset/blog/img/{b})')
    
