# ComplexImage
A processing sketch that passes each pixel of an image through a complex function. The center of the image is treated as 0 and the top pixels have positive imaginary components. It then colors each pixel the color of the pixel it landed on. The image is also treated like a torus in that if you go above the image you'll be at the bottom, if you go to the right of the image you'll be at the left, and vice versa.

![](https://i.imgur.com/OZqm2Kw.png)
This specific image was put through the function f(z)=200*sin(e^c^3i)
