# GunSway_in_One_Script
Single Godot script that gives you 3D gun sway with damping

## How Damping works

Everytime the gun is to be rotated, the rotation amount is diminshed by the following graph:
![image](https://user-images.githubusercontent.com/81257780/173378405-1e8ca28a-caea-4a61-8d13-4aa03134b9c9.png)
The effect of the sway decreases as the gun swings outwards further so that it converges to a maximum limit

This is where the following export variable is used:
```gdscript
export(Vector3) var LIMITS := Vector3(1.0, 1.0, 1.0)
```
Each value of `LIMITS` controls how much the Gun Sways on each axis. Note that `LIMITS.z` actually controls the roll of the gun when moving.
