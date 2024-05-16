import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from scipy.ndimage import zoom

def rgb_to_ycbcr(img):
    y = 0.299*img[:,:,0] + 0.587*img[:,:,1] + 0.114*img[:,:,2]
    cb = 128 - 0.168736*img[:,:,0] - 0.331264*img[:,:,1] + 0.5*img[:,:,2]
    cr = 128 + 0.5*img[:,:,0] - 0.418688*img[:,:,1] - 0.081312*img[:,:,2]
    return np.dstack([y, cb, cr])

def ycbcr_to_rgb(img):
    r = img[:,:,0] + 1.402 * (img[:,:,2]-128)
    g = img[:,:,0] - 0.34414 * (img[:,:,1]-128) - 0.71414 * (img[:,:,2]-128)
    b = img[:,:,0] + 1.772 * (img[:,:,1]-128)
    return np.dstack([r, g, b])

def C420(img):
    ycbcr = rgb_to_ycbcr(img)

    y = ycbcr[:,:,0]
    cb = np.zeros((ycbcr.shape[0]//2, ycbcr.shape[1]//2))
    cr = np.zeros((ycbcr.shape[0]//2, ycbcr.shape[1]//2))

    for i in range(0, ycbcr.shape[0], 2):
        for j in range(0, ycbcr.shape[1], 2):
            cb[i//2, j//2] = ycbcr[i, j, 1]
            cr[i//2, j//2] = ycbcr[i, j, 2]

    cb = zoom(cb, 2)
    cr = zoom(cr, 2)

    reconstructed = ycbcr_to_rgb(np.dstack([y, cb, cr]))
    reconstructed = np.clip(reconstructed, 0, 255)

    return reconstructed


img = mpimg.imread('image.jpg')

reconstructed = C420(img)

fig, ax = plt.subplots(1, 2)
ax[0].imshow(img)
ax[0].set_title('Original')
ax[1].imshow(reconstructed/255)
ax[1].set_title('Reconstructed')
plt.show()