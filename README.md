<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
    <a href="https://github.com/MH-Scripts/mh-walkwhencuffed/issues">
        <img src="https://img.shields.io/github/issues/MH-Scripts/mh-walkwhencuffed"/> 
    </a>
    <a href="https://github.com/MH-Scripts/mh-walkwhencuffed/watchers">
        <img src="https://img.shields.io/github/watchers/MH-Scripts/mh-walkwhencuffed"/> 
    </a> 
    <a href="https://github.com/MH-Scripts/mh-walkwhencuffed/network/members">
        <img src="https://img.shields.io/github/forks/MH-Scripts/mh-walkwhencuffed"/> 
    </a>  
    <a href="https://github.com/MH-Scripts/mh-walkwhencuffed/stargazers">
        <img src="https://img.shields.io/github/stars/MH-Scripts/mh-walkwhencuffed?color=white"/> 
    </a>
    <a href="https://github.com/MH-Scripts/mh-walkwhencuffed/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/MH-Scripts/mh-walkwhencuffed?color=black"/> 
    </a>      
</p>

# My Youtube Channel
- [Subscribe](https://www.youtube.com/@MaDHouSe79) 

# MH Walk When Cuffed

# For Players
- When you get cuffed by a cop you don't walk or move, with this script you also walk/run with the cop while cuffed.
- so when the cop is walking or running you are also automaticly going to walk or run animation.

# For Npc's
- You can Cuff/UnCuff, Search, Escort, Hostage, Surender or place Npc's in your vehicle for a cop chase.
- When a npc is cuffed the npc walk/run with you while you move around.

# Dependencies
- [ox_lib](https://github.com/overextended/ox_lib/releases)
- [qb-target](https://github.com/qbcore-framework/qb-target) or [ox_target](https://github.com/overextended/ox_target)
  
# Add code in `qb-policejob` (client side)
- in `qb-policejob/client/main.lua` at the bottom of the file.
```lua
local function GetIsHandcuffed() return isHandcuffed end
exports('GetIsHandcuffed', GetIsHandcuffed)
```

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
