from PIL import Image
import sys


def show_result(file):
    pixels_result = open(file, "r")

    pixel_lst = [int(i.replace("\n", "")) for i in pixels_result]

    im = Image.new('L', (320, 320))
    im.putdata(pixel_lst)
    im.save("result_decrypted.jpg")

    pixels_result.close()

    im.show()


file = sys.argv[1]
show_result(file)
