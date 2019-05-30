# Implementation-of-Laplacian-Of-Gaussian-Edgedetection-on-an-Image.
Edge detection using 2nd order filter 

Laplacian of Gaussian
The LoG operator calculates the second spatial
derivative of an image. This means that in areas where
the image has a constant intensity (i.e. where the
intensity gradient is zero), the LoG response will be zero.
• The noise in the input image is reduced by smoothing.
• Among the various smoothing operators, Gaussian filter
has desirable properties in terms of space-frequency
localization.
• Input image is therefore smoothed using the Gaussian
shaped smoothing operator, whose width sigma is user
controllable.
• In this approach, an image should first be convolved
with Gaussian filter.
