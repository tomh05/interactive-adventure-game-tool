import os, sys
from PIL import Image, ImageChops

size = 512,512
size = 108,108

for infile in sys.argv[1:]:
    outfile = os.path.splitext(infile)[0] + "-"+str(size[0])+".jpg"
    print "outfile is",outfile
    if infile != outfile:
        try:
            #im = Image.open(infile)
            #im.thumbnail(size, Image.ANTIALIAS)
            #im.save(outfile, "JPEG")
            image = Image.open(infile)
            image.thumbnail(size, Image.ANTIALIAS)
            image_size = image.size
            thumb = image.crop( (0, 0, size[0], size[1]) )
            offset_x = max( (size[0] - image_size[0]) / 2, 0 )
            offset_y = max( (size[1] - image_size[1]) / 2, 0 )
            new = Image.new('RGB', size, (255, 255, 255))  #with alpha
            new.paste(image,(offset_x,offset_y))
            #thumb = ImageChops.offset(thumb, offset_x, offset_y)
            new.save(outfile,"JPEG")
        except IOError:
            print "cannot create thumbnail for '%s'" % infile
