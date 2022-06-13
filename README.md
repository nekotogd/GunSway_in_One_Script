# Single Script for Gun Sway in Godot

[![Licence](https://img.shields.io/github/license/nekotogd/GunSway_in_One_Script?style=for-the-badge)](./LICENSE)

## How to Use
- Create a Spatial node, move it to where your hand should be
- Place your Gun Model as a child of the Spatial
- Give the Spatial node the Gun Sway script
- (Optional) for rolling motion when moving left or right, set `input_direction` to the direction of the joystick or keyboard input

## Parameters
- `LIMITS` controls how far the gun swings on each axis (see below)
- `return_speed` controls how quickly it interpolates back to the rest position
- `sway_speed` controls how quickly the gun sways when your mouse moves
- `mouse_sensitivity` controls how sensitive mouse inputs are

## How Damping works

Everytime the gun is to be rotated, the rotation amount is diminshed by the following graph:
![image](https://user-images.githubusercontent.com/81257780/173378405-1e8ca28a-caea-4a61-8d13-4aa03134b9c9.png)
The effect of the sway decreases as the gun swings outwards further so that it converges to a maximum limit

This is where the following export variable is used:
```gdscript
export(Vector3) var LIMITS := Vector3(1.0, 1.0, 1.0)
```
Each value of `LIMITS` controls how much the Gun Sways on each axis.

Note that `LIMITS.z` actually controls the roll of the gun when moving. Rolling only works if you pass a value to `input_direction`

## Support Me
[![YouTube](https://img.shields.io/badge/NekotoArts-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/channel/UCD7K_FECPHTF0z5okAVlh0g/featured) [![Itch.io](https://img.shields.io/badge/Itch-%23FF0B34.svg?style=for-the-badge&logo=Itch.io&logoColor=white)](https://nekotoarts.itch.io/) [![Reddit](https://img.shields.io/badge/Reddit-FF4500?style=for-the-badge&logo=reddit&logoColor=white)](https://reddit.com/user/XDGregory) [![Twitter](https://img.shields.io/badge/NekotoArts-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/NekotoArts) [![Godot Engine](https://img.shields.io/badge/Godot_Shaders-%23FFFFFF.svg?style=for-the-badge&logo=godot-engine)](https://godotshaders.com/author/nekotoarts/)

If you like my stuff, consider a sub to my [channel](https://www.youtube.com/channel/UCD7K_FECPHTF0z5okAVlh0g)?
