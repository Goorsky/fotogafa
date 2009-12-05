class Fleximage::Operator::Polaroid < Fleximage::Operator::Base
  def operate(angle)
    @image.border!(9, 9, "#f0f0ff")

    # Bend the image
    @image.background_color = "none"

    amplitude = @image.columns * 0.01        # vary according to taste
    wavelength = @image.rows  * 2

    @image.rotate!(90)
    @image = @image.wave(amplitude, wavelength)
    @image.rotate!(-90)

    # Make the shadow
    shadow = @image.flop
    shadow = shadow.colorize(1, 1, 1, "gray75")     # shadow color can vary to taste
    shadow.background_color = "white"       # was "none"
    shadow.border!(5, 5, "white")
    shadow = shadow.blur_image(0, 3)        # shadow blurriness can vary according to taste

    # Composite image over shadow. The y-axis adjustment can vary according to taste.
    @image = shadow.composite(@image, -amplitude/2, 5, Magick::OverCompositeOp)

    @image.rotate!(angle)                       # vary according to taste
    @image.trim!
  end
end