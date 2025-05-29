#!/usr/bin/env python3

import os
import argparse

if __name__ == '__main__':
    psr = argparse.ArgumentParser(description='resize and upload')
    psr.add_argument('-r', dest='resize_size', type=int, default=-1,
                        help='set positive size to make thumbnail')
    psr.add_argument('-u', dest='upload', type=bool, default=False,
                        help='upload image to gcs')
    # psr.add_argument('file', help='image file to resize or upload')
    args, arg_files = psr.parse_known_args()

    for f in arg_files:
        print(f'processing {f}')
        r = ""
        if args.resize_size > 0:
            n, e = os.path.splitext(f)
            r = os.path.basename(n) + f'_{args.resize_size}.jpg'
            os.system(f'convert {f} -resize {args.resize_size} {r}')
            print(f'made {r}')

        if args.upload:
            u, m = "", ""
            if r:
                u, b = r, r
            else:
                u, b = f, os.path.basename(f)
            
            os.system(f'gsutil cp {u} gs://homin-dev_asset/blog/img/{b}')
            print(f'use ![{b}](https://asset.homin.dev/blog/img/{b})')
    
