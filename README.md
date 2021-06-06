# Sharingan Loader for iOS
Animated sharingan loader for iOS projects.
This is a fun project created using SwiftUI with love for the Uchiha clan. 


![platform](https://img.shields.io/badge/platform-iOS-orange)
[![GitHub license](https://img.shields.io/badge/License-Apache2.0-blue.svg)](LICENSE)
![Repository size](https://img.shields.io/github/repo-size/Fury-2K/Sharingan-Loader)
![GitHub stars](https://img.shields.io/github/stars/Fury-2K/Sharingan-Loader?style=social)
![GitHub forks](https://img.shields.io/github/forks/Fury-2K/Sharingan-Loader?style=social)
![GitHub follow](https://img.shields.io/github/followers/Fury-2K?style=social)

## What's New ?
- Sharingan loader with 3 tomoe.
 
## Languages / Frameworks Used
- SwiftUI
- Swift


**The project is built supporting iOS 14 and above.**

## How to use?

<img align="right" src="/Resources/sharingan_loader.gif" height="500">

```swift
SharinganView(diameter: 150, animationDuration: 1, backgroundDarkness: 0.2, isVisible: $showingLoader)
The initializer is like - 
SharinganView(diameter: CGFloat, animationDuration: Double, backgroundDarkness: Double, isVisible: Binding<Bool>)
```
This has the following properties to help customize -<br>
```swift
/// Diameter of the sharingan eye.
var diameter: CGFloat

/// Time taken for the eye to complete 1 full rotation.
var animationDuration: Double

/// Black background intensity.
var backgroundDarkness: Double

@Binding var isVisible: Bool
```
- **diameter**- Diameter aka width and height for the sharingan eye. *This has a default value of 100.*
- **animationDuration**- As the name suggests, is used for animation duration for the loader view. *This is set to a default value of 1 seconds.*
- **backgroundDarkness**- This is the intensity of darkness behind the loader. 0 being the lowest and 1 being the highest. *This has a default value of 0.2.*
- **isVisible**- This is the binding boolean which shows the loading indicator view if set to true and vic versa.

## Looking to contribute?
- Feel free to add other loaders related to the anime.
- Raise the PR. I will be happy to review and merge it :)

## Having trouble?
* If you are having trouble with this project or if you find any bugs, do open a new issue and describe the problem.
* Alternatively, you can drop me a mail @ manas.agrawal990@gmail.com.

## Follow if you like it, ⭐️ if you love it.

## Credits
**©** **Manas Aggarwal** | *2021*
