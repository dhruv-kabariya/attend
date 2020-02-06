import qrcode
import PIL
import sys,os



def generating(sid):
    
    qr = qrcode.QRCode(
    version = 1,
    error_correction = qrcode.constants.ERROR_CORRECT_H,
    box_size = 10,
    border = 4,
    )

    path = os.getcwd()+"\\faculty\\static\\"

    data = str(sid)
    qr.add_data(data)
    qr.make(fit = True)

    img = qr.make_image()
    img.save(path + data + ".png")

    return data
    