from PIL import Image
import os

all_files = [x for x in os.listdir() if x.endswith(".jpg")]
all_files = sorted(all_files)

for file in all_files:
    print(file)
    im = Image.open(file)
    
    if im.size[0] > im.size[1]:
        im = im.transpose(Image.ROTATE_270)

    size = 900, 1200
    im.resize(size, Image.ANTIALIAS).save(file) 
    
    
# Append images to PDF    
imagelist = [x for x in os.listdir() if x.endswith(".jpg")]
imagelist

from fpdf import FPDF
pdf = FPDF()
for image in imagelist:
    pdf.add_page()
    # pdf.image(image,x,y,w,h)
    pdf.image(image,0,0,210,297 )    
pdf.output("yourfile.pdf", "F")



