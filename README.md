# OUC FFT homework

These are our team's works for the course of Fast Fourier Transform Spectrometry applications in Ocean University of China. The whole files include these parts: 2nd, 3rd, 4th, 5th of homework, corresponding four simulations of actual Fourier Transform Spectrum problems.

1.  The affects of scan length, the angle of divergence to spectrum and combined affect.

   (扫描距离、发散角以及综合二因素对FFT光谱的影响，假定光是单一波长）

   Suppose the light is perfect single wavelength, then

   * To scan length,there is equation:  $\beta_{ILS}(\sigma)=2L\mathrm sinc [2\pi(\sigma_0-\sigma)L]$
   * To divergence angle simply, the equation is: $\beta_{Div-ILS}(\sigma)=[\pi/(\sigma_0\Omega_{max})] rect(\sigma_1,\sigma_2)$
   * Combined them,there is equation: $\beta_{ILS}(\sigma)=\beta_{Div-ILS} \ast2L\mathrm sinc [2\pi(\sigma_0-\sigma)L]$

   Where $\sigma_0$ presents the wavenumber of the single light.

   These part simulation is done in 2nd homework file. One of results showed below.![发散角和距离对傅里叶光谱测量影响2](C:\Users\shangsong\Desktop\FThomework\发散角和距离对傅里叶光谱测量影响2.bmp)

2. Plus zeros to the interferogram, and do fourier transform. Observe the distinction between various numbers of zero and none of zero. After this, try different window box to eliminate spectral side lobes.

   (补零，让FFT光谱曲线光滑。补零后会加大旁瓣，用不同窗口消除旁瓣，对比结果）

    