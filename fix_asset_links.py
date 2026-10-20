import os
import re

POST_DIR = "content/post"

# 정규식: ![...](https://asset.homin.dev/....확장자)
pattern = re.compile(r'(!\[[^\]]*\]\(https://asset\.homin\.dev/[^)]+?)(\.(?!webp)[a-zA-Z0-9]+)(\))')

def replace_to_webp(match):
    return match.group(1) + '.webp' + match.group(3)

for root, _, files in os.walk(POST_DIR):
    for fname in files:
        if fname.endswith('.md'):
            fpath = os.path.join(root, fname)
            with open(fpath, encoding='utf-8') as f:
                content = f.read()
            new_content = pattern.sub(replace_to_webp, content)
            if new_content != content:
                with open(fpath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"Patched: {fpath}") 