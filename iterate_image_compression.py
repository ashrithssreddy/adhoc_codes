from PIL import Image
import os

all_files = [x for x in os.listdir() if x.endswith(".jpg")]
all_files

for file in all_files:
    print(file)
    im = Image.open(file)    
    # im.save("resized_2" + file, dpi=(900,1200)) 
    size = 900, 1200
    im_resized = im.resize(size, Image.ANTIALIAS)
    im_resized.save(file) # , "JPG"    