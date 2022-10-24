# Sharingan Loader for iOS
Animated sharingan loader for iOS projects.
This is a fun project created using SwiftUI with love for the Uchiha clan. More types of eyes to come with tons of customizations...<br>
Feel free to create an issue for suggestions or feature requests.


![platform](https://img.shields.io/badge/platform-iOS-orange)&nbsp;
[![GitHub license](https://img.shields.io/badge/License-Apache2.0-blue.svg)](LICENSE)&nbsp;
![Repository size](https://img.shields.io/github/repo-size/Fury-2K/Sharingan-Loader)&nbsp;
![GitHub stars](https://img.shields.io/github/stars/Fury-2K/Sharingan-Loader?style=social)&nbsp;
![GitHub forks](https://img.shields.io/github/forks/Fury-2K/Sharingan-Loader?style=social)&nbsp;
![GitHub follow](https://img.shields.io/github/followers/Fury-2K?style=social)

<p><b> 
The mangekyou sharingan is awakened after 4x `animationDuration`. 
</b></p>

Sharingan | Mangekyou Sharingan
--- | ---
<img align="right" src="/Resources/img1.png" width="280"> | <img align="right" src="/Resources/img2.png" width="280">

## What's New ?
- [v0.2.0] Sharingan loader with Mangekyou transformation.
- [v0.1.3] Sharingan loader with 3 tomoe. 
 
## Languages / Frameworks Used
- SwiftUI
- Swift

**The project is built supporting iOS 14 and above.**

## How to use?
<img align="right" src="/Resources/mangekyou.gif"  width="300">

First add the project using Swift Package Manager like this - 
```
dependencies: [
    .package(url: "https://github.com/Fury-2K/Sharingan-Loader.git", from: "0.1.3")
]
```
In the codebase you can do the following to use the loader -<br>
1) Add `import SharinganLoader`<br>
2) Use the following code to embed the loader.<br>

```swift
SharinganLoader(diameter: 150,
              animationDuration: 1, 
              backgroundDarkness: 0.2, 
              isVisible: $showingLoader,
              shouldTransformToMangekyou: true)

The initializer is like - 
SharinganLoader(diameter: CGFloat,
              animationDuration: Double,
              backgroundDarkness: Double,
              isVisible: Binding<Bool>,
              shouldTransformToMangekyou: Bool)
```
This has the following properties to help customize -<br>
```swift
/// Diameter of the sharingan eye.
var diameter: CGFloat

/// Time taken for the eye to complete 1 full rotation.
var animationDuration: Double

/// Black background intensity. 
/// Range => 0 to 1
var backgroundDarkness: Double

/// Binding var to toggle loader visibility.
@Binding var isVisible: Bool

/// Toggle to allow mangekyou sharingan awakening.
var shouldTransformToMangekyou: Bool
```
- **diameter**- Diameter aka width and height for the sharingan eye. *This has a default value of 100.*
- **animationDuration**- As the name suggests, is used for animation duration for the loader view. *This is set to a default value of 1 seconds.*
- **backgroundDarkness**- This is the intensity of darkness behind the loader. 0 being the lowest and 1 being the highest. *This has a default value of 0.2.*
- **isVisible**- This is the binding boolean which shows the loading indicator view if set to true and vic versa.
- **shouldTransformToMangekyou**- This sets if the mangekyou sharingan will awaken or not.

## Looking to contribute?
- Feel free to add other loaders related to the anime.
- Raise the PR. I will be happy to review and merge it :)

## Having trouble?
* If you are having trouble with this project or if you find any bugs, do open a new issue and describe the problem.
* Alternatively, you can drop me a mail @ manas.agrawal990@gmail.com.

## Follow if you like it, ⭐️ if you love it.

## Credits
**©** **Manas Aggarwal** | *2021*
