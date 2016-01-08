/*

    Image Filters (Uses RGBAImage.swift)

    github.com/cmdshepard/Image-Filter-Processor-Swift
    
    By /cmdshepard

    
    ------------------------
        NAME OF FILTERS:

        1 - blue
        2 - grayscale
        3 - invert
        4 - sepia
        5 - bright
    ------------------------

*/


import UIKit

class imageProcessor{
    
    // properties of imageProcessor
    
    var imageInRGBA: RGBAImage?
    
    // initialization of class
    init(imageInput: UIImage){
        
        imageInRGBA = RGBAImage(image: imageInput)!
    }
    
    // method that applies the filters at default intensity using String input (to every pixel of image)
    func applyFilter(filter: String) -> UIImage{
        switch filter{
            case "blue":
                var totalBlue = 0
                let avgBlue: Int
                let pixelCount: Int
                for y in 0..<imageInRGBA!.height{
                    for x in 0..<imageInRGBA!.width{
                        let arrayIndex = y * imageInRGBA!.width + x
                        var selectedPixel = imageInRGBA!.pixels[arrayIndex]
                        totalBlue += Int(selectedPixel.blue)
                    }
                }
                pixelCount = imageInRGBA!.width * imageInRGBA!.height   // total number of pixels in the image
                avgBlue = totalBlue / pixelCount
                for y in 0..<imageInRGBA!.height{
                    for x in 0..<imageInRGBA!.width{
                        let arrayIndex = y * imageInRGBA!.width + x
                        var selectedPixel = imageInRGBA!.pixels[arrayIndex]
                        let blueDiff = Int(selectedPixel.blue) - avgBlue
                        if (blueDiff>0){
                                selectedPixel.blue = UInt8(max(0,min(255,avgBlue+blueDiff*5)))
                                imageInRGBA!.pixels[arrayIndex] = selectedPixel
                        }
                    }
                }
            case "grayscale":
                for y in 0..<imageInRGBA!.height{
                    for x in 0..<imageInRGBA!.width{
                        let arrayIndex = y * imageInRGBA!.width + x
                        var selectedPixel = imageInRGBA!.pixels[arrayIndex]
                        let weightedAvgRed = Double(selectedPixel.red) * 0.21
                        let weightedAvgGreen = Double(selectedPixel.green) * 0.72
                        let weightedAvgBlue = Double(selectedPixel.blue) * 0.07
                        let avgValue = weightedAvgRed + weightedAvgGreen + weightedAvgBlue / 3
                        selectedPixel.red = UInt8(max(0,min(255,avgValue)))
                        selectedPixel.green = UInt8(max(0,min(255,avgValue)))
                        selectedPixel.blue = UInt8(max(0,min(255,avgValue)))
                        imageInRGBA!.pixels[arrayIndex] = selectedPixel
                    }
                }
            case "invert":
                for y in 0..<imageInRGBA!.height{
                    for x in 0..<imageInRGBA!.width{
                        let arrayIndex = y * imageInRGBA!.width + x
                        var selectedPixel = imageInRGBA!.pixels[arrayIndex]
                        let newRed = 255 - Int(selectedPixel.red)
                        let newGreen = 255 - Int(selectedPixel.green)
                        let newBlue = 255 - Int(selectedPixel.blue)
                        selectedPixel.red = UInt8(max(0,min(255,newRed)))
                        selectedPixel.green = UInt8(max(0,min(255,newGreen)))
                        selectedPixel.blue = UInt8(max(0,min(255,newBlue)))
                        imageInRGBA!.pixels[arrayIndex] = selectedPixel
                    }
                }
            case "sepia":
                for y in 0..<imageInRGBA!.height{
                    for x in 0..<imageInRGBA!.width{
                        let arrayIndex = y * imageInRGBA!.width + x
                        var selectedPixel = imageInRGBA!.pixels[arrayIndex]
                        let red = Double(selectedPixel.red)
                        let green = Double(selectedPixel.green)
                        let blue = Double(selectedPixel.blue)
                        let redAlgo = (red * 0.393) + (green * 0.769) + (blue * 0.189)
                        let greenAlgo = (red * 0.349) + (green * 0.686) + (blue * 0.168)
                        let blueAlgo = (red * 0.272) + (green * 0.534) + (blue * 0.131)
                        selectedPixel.red = UInt8(max(0,min(255,redAlgo)))
                        selectedPixel.green = UInt8(max(0,min(255,greenAlgo)))
                        selectedPixel.blue = UInt8(max(0,min(255,blueAlgo)))
                        imageInRGBA!.pixels[arrayIndex] = selectedPixel
                    }
                }
            case "bright":
                for y in 0..<imageInRGBA!.height{
                    for x in 0..<imageInRGBA!.width{
                        let arrayIndex = y * imageInRGBA!.width + x
                        var selectedPixel = imageInRGBA!.pixels[arrayIndex]
                        let red = Int(selectedPixel.red) * 2
                        let green = Int(selectedPixel.green) * 2
                        let blue = Int(selectedPixel.blue) * 2
                        selectedPixel.red = UInt8(max(0,min(255,red)))
                        selectedPixel.green = UInt8(max(0,min(255,green)))
                        selectedPixel.blue = UInt8(max(0,min(255,blue)))
                        imageInRGBA!.pixels[arrayIndex] = selectedPixel
                    }
                }
            default: print("ERROR: No filter selected. Could not apply filter.") ;break; // break the switch in case of error
        }
        return imageInRGBA!.toUIImage()!
    }
}
