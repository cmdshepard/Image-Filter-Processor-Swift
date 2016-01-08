# Image-Filter-Processor-Swift

This library contains code for five different filter formulas.

How to use:
1) Import 'RGBAImage.swift' & 'ImageProcessor.swift' into your project
2) Create & initialize an image processor object with the applyFilter method.
3) The applyFilter method takes in the name of the default filter as a String and outputs the filtered image as a UIImage

// Sample:
var image: UIImage?

let blueFilter = imageProcessor(imageInput: image!).applyFilter("blue")                 // 'blue' default filter
let grayscaleFilter = imageProcessor(imageInput: image!).applyFilter("grayscale")       // 'grayscale' default filter
let invertFilter = imageProcessor(imageInput: image!).applyFilter("invert")             // 'invert' default filter
let sepiaFilter = imageProcessor(imageInput: image!).applyFilter("sepia")               // 'sepia' default filter
let brightFilter = imageProcessor(imageInput: image!).applyFilter("bright")             // 'bright' default filter


print("Cheers!")
